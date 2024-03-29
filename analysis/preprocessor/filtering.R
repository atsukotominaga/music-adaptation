## ----setup, include = FALSE---------------------------------------------------
# set chunk option
knitr::opts_chunk$set(echo = FALSE)

# set working directory
if (!require("here")) {install.packages("here"); require("here")}
here::i_am("filtering.Rmd")

# create a folder if not exists
if (!file.exists(here("filtered"))){
  dir.create(here("filtered"))
}

# read functions
source(here("function.R"))

# read a text file for ideal performance
dt_ideal <- read.table(here("ideal.txt"))
colnames(dt_ideal) <- "Pitch"
dt_ideal$RowNr <- 1:nrow(dt_ideal)
setcolorder(dt_ideal, c(2, 1))

# create a list of data file names
lf <- list.files(here("raw_data"), pattern = "txt")

# create raw_data - merge all data files into one
raw_data <- data.table()
for (i in 1:length(lf)){
  data_i <- fread(file.path(here("raw_data"), lf[i]), header = F, sep = " ", dec = ".")
  raw_data <- rbind(raw_data, data_i)
}

# add column namesls
colnames(raw_data) <- c("NoteNr", "TimeStamp", "Pitch", "Velocity", "Key_OnOff", "Device", "SubNr", "TrialNr", "Stimuli", "Session")

# clean raw_data
raw_data$NoteNr <- as.numeric(gsub(",", "", raw_data$NoteNr))
raw_data$Session <- gsub(";", "", raw_data$Session)

# sort by SubNr, TrialNr
raw_data <- raw_data[order(raw_data$SubNr, raw_data$TrialNr),]

# raw_data without metronome
dt_all <- raw_data[Pitch != 31 & Pitch != 34]

# onset and offset for experimental session
dt_onset <- dt_all[Key_OnOff == 1 & Session == "experiment"]
dt_offset <- dt_all[Key_OnOff == 0 & Session == "experiment"]


## ----onset, echo = FALSE------------------------------------------------------
dt_error_onset <- checker(dt_onset, dt_ideal)

# mark imperfect performances
dt_onset$Error <- 0
for (error in 1:nrow(dt_error_onset)){
  dt_onset[SubNr == dt_error_onset$SubNr[error] & TrialNr == dt_error_onset$TrialNr[error]]$Error <- 1
}

dt_correct_onset_1 <- dt_onset[Error == 0]
dt_correct_onset_1$RowNr <- rep(1:72, nrow(dt_correct_onset_1)/72)
setcolorder(dt_correct_onset_1, c(12, 1:11))

# export csv
fwrite(dt_correct_onset_1, file = here("filtered", "dt_correct_onset_1.txt"))

# print the result
dt_error_onset

# add CorrectionNr column
dt_error_onset$CorrectionNr <- NA


## ----offset, echo = FALSE-----------------------------------------------------
dt_error_offset <- checker(dt_offset, dt_ideal)

# mark imperfect performances
dt_offset$Error <- 0
for (error in 1:nrow(dt_error_offset)){
  dt_offset[SubNr == dt_error_offset$SubNr[error] & TrialNr == dt_error_offset$TrialNr[error]]$Error <- 1
}

dt_correct_offset_1 <- dt_offset[Error == 0]
dt_correct_offset_1$RowNr <- rep(1:72, nrow(dt_correct_offset_1)/72)
setcolorder(dt_correct_offset_1, c(12, 1:11))

# export csv
fwrite(dt_correct_offset_1, file = here("filtered", "dt_correct_offset_1.txt"))

# print the result
dt_error_offset

# add CorrectionNr column
dt_error_offset$CorrectionNr <- NA


## ----extra-onset, include = FALSE, eval = FALSE-------------------------------
## error_extra_onset <- dt_error_onset[Reason == "Extra Notes"]
## dt_correct_onset_2 <- data.table()
## for (row in 1:nrow(error_extra_onset)){
##   current <- dt_onset[SubNr == error_extra_onset$SubNr[row] & TrialNr == error_extra_onset$TrialNr[row]]
##   decision = 2
##   correction = 0 # # of correction for reporting stats
##   while (decision == 2){
##     print(sprintf("SubNr: %s, TrialNr: %s", unique(current$SubNr), unique(current$TrialNr)))
##     print("----- First check -----")
##     current <- edit(current, dt_ideal)
##     print("----- Correction check -----")
##     edit(current, dt_ideal)
##     decision <- menu(c("y", "n", "other"), title = "Save the current data? (to continue, enter 'n')")
##     if (decision == 1){
##       correction = correction + 1
##       error_extra_onset$CorrectionNr[row] <- correction
##       dt_correct_onset_2 <- rbind(dt_correct_onset_2, current[, -c(5:6)])
##     } else if (decision == 3){
##       error_extra_onset$CorrectionNr[row] <- readline(prompt = "Reason?: ")
##     } else if (decision == 2){
##       correction = correction + 1
##       print("----- Continue correction -----")
##     }
##   }
## }
## 
## # export csv
## fwrite(dt_correct_onset_2, file = here("filtered", "dt_correct_onset_2.txt"))
## fwrite(error_extra_onset, file = here("filtered", "error_extra_onset.txt"))


## ---- echo = FALSE------------------------------------------------------------
error_extra_onset <- fread(here("filtered/error_extra_onset.txt"))
error_extra_onset


## ----extra-offset, include = FALSE, eval = FALSE------------------------------
## error_extra_offset <- dt_error_offset[Reason == "Extra Notes"]
## dt_correct_offset_2 <- data.table()
## for (row in 1:nrow(error_extra_offset)){
##   current <- dt_offset[SubNr == error_extra_offset$SubNr[row] & TrialNr == error_extra_offset$TrialNr[row]]
##   decision = 2
##   correction = 0 # # of correction for reporting stats
##   while (decision == 2){
##     print(sprintf("SubNr: %s, TrialNr: %s", unique(current$SubNr), unique(current$TrialNr)))
##     print("----- First check -----")
##     current <- edit(current, dt_ideal)
##     print("----- Correction check -----")
##     edit(current, dt_ideal)
##     decision <- menu(c("y", "n", "other"), title = "Save the current data? (to continue, enter 'n')")
##     if (decision == 1){
##       correction = correction + 1
##       error_extra_offset$CorrectionNr[row] <- correction
##       dt_correct_offset_2 <- rbind(dt_correct_offset_2, current[, -c(5:6)])
##     } else if (decision == 3){
##       error_extra_offset$CorrectionNr[row] <- readline(prompt = "Reason?: ")
##     } else if (decision == 2){
##       correction = correction + 1
##       print("----- Continue correction -----")
##     }
##   }
## }
## 
## # export csv
## fwrite(dt_correct_offset_2, file = here("filtered", "dt_correct_offset_2.txt"))
## fwrite(error_extra_offset, file = here("filtered", "error_extra_offset.txt"))


## ---- echo = FALSE------------------------------------------------------------
error_extra_offset <- fread(here("filtered", "error_extra_offset.txt"))
error_extra_offset


## ----missing-onset, include = FALSE, eval = FALSE-----------------------------
## error_missing_onset <- dt_error_onset[Reason == "Missing Notes"]
## 
## dt_correct_onset_3 <- data.table()
## for (row in 1:nrow(error_missing_onset)){
##   current <- dt_onset[SubNr == error_missing_onset$SubNr[row] & TrialNr == error_missing_onset$TrialNr[row]]
##   diff <- abs(nrow(dt_ideal) - nrow(current))
##   if (diff < 5){
##     # insert NA row
##     current <- insert_na(current, dt_ideal)
##     print(sprintf("SubNr: %s, TrialNr: %s", unique(current$SubNr), unique(current$TrialNr)))
##     print("----- Correction check -----")
##     current <- edit(current, dt_ideal)
##     decision <- menu(c("y", "other"), title = "Save the current data?")
##     if (decision == 1){
##       error_missing_onset$CorrectionNr[row] <- diff
##       dt_correct_onset_3 <- rbind(dt_correct_onset_3, current[, -c(5:6)])
##     } else if (decision == 2){
##       error_missing_onset$CorrectionNr[row] <- readline(prompt = "Reason?: ")
##     }
##   } else {
##     error_missing_onset$CorrectionNr[row] <- "Check individually"
##   }
## }
## 
## # export csv
## fwrite(dt_correct_onset_3, file = here("filtered", "dt_correct_onset_3.txt"))
## fwrite(error_missing_onset, file = here("filtered", "error_missing_onset.txt"))


## ---- echo = FALSE------------------------------------------------------------
error_missing_onset <- fread(here("filtered", "error_missing_onset.txt"))
error_missing_onset


## ----missing-offset, include = FALSE, eval = FALSE----------------------------
## error_missing_offset <- dt_error_offset[Reason == "Missing Notes"]
## 
## dt_correct_offset_3 <- data.table()
## for (row in 1:nrow(error_missing_offset)){
##   current <- dt_offset[SubNr == error_missing_offset$SubNr[row] & TrialNr == error_missing_offset$TrialNr[row]]
##   diff <- abs(nrow(dt_ideal) - nrow(current))
##   if (diff < 5){
##     # insert NA row
##     current <- insert_na(current, dt_ideal)
##     print(sprintf("SubNr: %s, TrialNr: %s", unique(current$SubNr), unique(current$TrialNr)))
##     print("----- Correction check -----")
##     current <- edit(current, dt_ideal)
##     decision <- menu(c("y", "other"), title = "Save the current data?")
##     if (decision == 1){
##       error_missing_offset$CorrectionNr[row] <- diff
##       dt_correct_offset_3 <- rbind(dt_correct_offset_3, current[, -c(5:6)])
##     } else if (decision == 2){
##       error_missing_offset$CorrectionNr[row] <- readline(prompt = "Reason?: ")
##     }
##   } else {
##     error_missing_offset$CorrectionNr[row] <- "Check individually"
##   }
## }
## 
## # export csv
## fwrite(dt_correct_offset_3, file = here("filtered", "dt_correct_offset_3.txt"))
## fwrite(error_missing_offset, file = here("filtered", "error_missing_offset.txt"))


## ---- echo = FALSE------------------------------------------------------------
error_missing_offset <- fread(here("filtered", "error_missing_offset.txt"))
error_missing_offset


## ----sub-onset, include = FALSE, eval = FALSE---------------------------------
## error_sub_onset <- dt_error_onset[startsWith(Reason, "Substituted")]
## 
## dt_correct_onset_4 <- data.table()
## for (row in 1:nrow(error_sub_onset)){
##   current <- dt_onset[SubNr == error_sub_onset$SubNr[row] & TrialNr == error_sub_onset$TrialNr[row]]
##   decision = 2
##   correction = 0 # # of correction for reporting stats
##   while (decision == 2){
##     print(sprintf("SubNr: %s, TrialNr: %s", unique(current$SubNr), unique(current$TrialNr)))
##     print("----- First check -----")
##     current <- edit(current, dt_ideal)
##     print("----- Correction check -----")
##     edit(current, dt_ideal)
##     decision <- menu(c("y", "n", "other"), title = "Save the current data? (to continue, enter 'n')")
##     if (decision == 1){
##       correction = correction + 1
##       error_sub_onset$CorrectionNr[row] <- correction
##       dt_correct_onset_4 <- rbind(dt_correct_onset_4, current[, -c(5:6)])
##     } else if (decision == 3) {
##       error_sub_onset$CorrectionNr[row] <- readline(prompt = "Reason?: ")
##     } else if (decision == 2){
##       correction = correction + 1
##       print("----- Continue correction -----")
##     }
##   }
## }
## 
## # export csv
## fwrite(dt_correct_onset_4, file = here("filtered", "dt_correct_onset_4.txt"))
## fwrite(error_sub_onset, file = here("filtered", "error_sub_onset.txt"))


## ---- echo = FALSE------------------------------------------------------------
error_sub_onset <- fread(here("filtered", "error_sub_onset.txt"))
error_sub_onset


## ----sub-offset, include = FALSE, eval = FALSE--------------------------------
## error_sub_offset <- dt_error_offset[startsWith(Reason, "Substituted")]
## 
## dt_correct_offset_4 <- data.table()
## for (row in 1:nrow(error_sub_offset)){
##   current <- dt_offset[SubNr == error_sub_offset$SubNr[row] & TrialNr == error_sub_offset$TrialNr[row]]
##   decision = 2
##   correction = 0 # # of correction for reporting stats
##   while (decision == 2){
##     print(sprintf("SubNr: %s, TrialNr: %s", unique(current$SubNr), unique(current$TrialNr)))
##     print("----- First check -----")
##     current <- edit(current, dt_ideal)
##     print("----- Correction check -----")
##     edit(current, dt_ideal)
##     decision <- menu(c("y", "n", "other"), title = "Save the current data? (to continue, enter 'n')")
##     if (decision == 1){
##       correction = correction + 1
##       error_sub_offset$CorrectionNr[row] <- correction
##       dt_correct_offset_4 <- rbind(dt_correct_offset_4, current[, -c(5:6)])
##     } else if (decision == 3) {
##       error_sub_offset$CorrectionNr[row] <- readline(prompt = "Reason?: ")
##     } else if (decision == 2){
##       correction = correction + 1
##       print("----- Continue correction -----")
##     }
##   }
## }
## 
## # export csv
## fwrite(dt_correct_offset_4, file = here("filtered", "dt_correct_offset_4.txt"))
## fwrite(error_sub_offset, file = here("filtered", "error_sub_offset.txt"))


## ---- echo = FALSE------------------------------------------------------------
error_sub_offset <- fread(here("filtered", "error_sub_offset.txt"))
error_sub_offset


## ---- include = FALSE---------------------------------------------------------
# combine error
error_onset <- rbind(error_extra_onset, error_missing_onset, error_sub_onset)

error_ind_onset <- error_onset[startsWith(CorrectionNr, "Check")]


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_1 <- dt_onset[SubNr == error_ind_onset$SubNr[1] & TrialNr == error_ind_onset$TrialNr[1]]
## current_1$RowNr <- c(1:nrow(current_1))
## current_1$Ideal <- c(dt_ideal$Pitch, rep(NA, abs(nrow(current_1) - nrow(dt_ideal))))
## graph(current_1)
## 
## # remove the first error
## current_1 <- edit(current_1, dt_ideal)
## current_1$Ideal <- dt_ideal$Pitch
## graph(current_1)
## 
## # corrected the second error (substituted note)
## current_1 <- edit(current_1, dt_ideal)
## graph(current_1)
## 
## error_ind_onset$CorrectionNr[1] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_2 <- dt_onset[SubNr == error_ind_onset$SubNr[2] & TrialNr == error_ind_onset$TrialNr[2]]
## 
## # insert one note
## current_2 <- insert_na(current_2, dt_ideal)
## current_2$RowNr <- c(1:nrow(current_2))
## current_2$Ideal <- dt_ideal$Pitch
## graph(current_2)
## 
## # insert one note
## current_2 <- edit(current_2, dt_ideal)
## current_2$RowNr <- 1:nrow(current_2)
## current_2$Ideal <- cc(dt_ideal$Pitch, rep(NA, abs(nrow(current_2) - nrow(dt_ideal))))
## graph(current_2)
## 
## # remove one extra note
## current_2 <- edit(current_2, dt_ideal)
## current_2$Ideal <- dt_ideal$Pitch
## graph(current_2)
## 
## error_ind_onset$CorrectionNr[2] <- 3


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_3 <- dt_onset[SubNr == error_ind_onset$SubNr[3] & TrialNr == error_ind_onset$TrialNr[3]]
## current_3$RowNr <- c(1:nrow(current_3))
## current_3$Ideal <- dt_ideal$Pitch
## graph(current_3)
## 
## # remove the first error
## current_3 <- edit(current_3, dt_ideal)
## 
## # insert one note
## current_3 <- insert_na(current_3, dt_ideal)
## current_3$Ideal <- dt_ideal$Pitch
## graph(current_3)
## 
## error_ind_onset$CorrectionNr[3] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_4 <- dt_onset[SubNr == error_ind_onset$SubNr[4] & TrialNr == error_ind_onset$TrialNr[4]]
## current_4$RowNr <- c(1:nrow(current_4))
## current_4$Ideal <- dt_ideal$Pitch
## graph(current_4)
## 
## # insert one skipped note
## current_4 <- edit(current_4, dt_ideal)
## current_4$RowNr <- 1:nrow(current_4)
## current_4$Ideal <- c(dt_ideal$Pitch, rep(NA, abs(nrow(current_4) - nrow(dt_ideal))))
## graph(current_4)
## 
## # remove one extra note
## current_4 <- edit(current_4, dt_ideal)
## current_4$RowNr <- c(1:nrow(current_4))
## current_4$Ideal <- dt_ideal$Pitch
## graph(current_4)
## 
## error_ind_onset$CorrectionNr[4] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_5 <- dt_onset[SubNr == error_ind_onset$SubNr[5] & TrialNr == error_ind_onset$TrialNr[5]]
## current_5$RowNr <- c(1:nrow(current_5))
## current_5$Ideal <- dt_ideal$Pitch
## graph(current_5)
## 
## # remove one wrong note
## current_5 <- edit(current_5, dt_ideal)
## 
## # insert one note
## current_5 <- insert_na(current_5, dt_ideal)
## current_5$RowNr <- c(1:nrow(current_5))
## current_5$Ideal <- dt_ideal$Pitch
## graph(current_5)
## 
## error_ind_onset$CorrectionNr[5] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_6 <- dt_onset[SubNr == error_ind_onset$SubNr[6] & TrialNr == error_ind_onset$TrialNr[6]]
## current_6$RowNr <- c(1:nrow(current_6))
## current_6$Ideal <- dt_ideal$Pitch
## graph(current_6)
## 
## # remove one extra note
## current_6 <- edit(current_6, dt_ideal)
## 
## # insert one note
## current_6 <- insert_na(current_6, dt_ideal)
## current_6$RowNr <- c(1:nrow(current_6))
## current_6$Ideal <- dt_ideal$Pitch
## graph(current_6)
## 
## error_ind_onset$CorrectionNr[6] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_7 <- dt_onset[SubNr == error_ind_onset$SubNr[7] & TrialNr == error_ind_onset$TrialNr[7]]
## current_7$RowNr <- c(1:nrow(current_7))
## current_7$Ideal <- dt_ideal$Pitch
## graph(current_7)
## 
## # insert one note
## current_7 <- edit(current_7, dt_ideal)
## current_7$RowNr <- 1:nrow(current_7)
## current_7$Ideal <- c(dt_ideal$Pitch, rep(NA, abs(nrow(current_7) - nrow(dt_ideal))))
## graph(current_7)
## 
## # remove one note
## current_7 <- edit(current_7, dt_ideal)
## current_7$RowNr <- c(1:nrow(current_7))
## current_7$Ideal <- dt_ideal$Pitch
## graph(current_7)
## 
## error_ind_onset$CorrectionNr[7] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## dt_correct_onset_5 <- rbind(current_1, current_2, current_3, current_4, current_5, current_6, current_7)
## dt_correct_onset_5 <- dt_correct_onset_5[, -c(5:6)]
## 
## # export csv
## fwrite(dt_correct_onset_5, file = here("filtered", "dt_correct_onset_5.txt"))
## fwrite(error_ind_onset, file = here("filtered", "error_ind_onset.txt"))


## ---- echo = FALSE------------------------------------------------------------
error_ind_onset <- fread(here("filtered", "error_ind_onset.txt"))
error_ind_onset


## ---- echo = FALSE------------------------------------------------------------
# combine error
error_offset <- rbind(error_extra_offset, error_missing_offset, error_sub_offset)

error_ind_offset <- error_offset[startsWith(CorrectionNr, "Check")]


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_1 <- dt_offset[SubNr == error_ind_offset$SubNr[1] & TrialNr == error_ind_offset$TrialNr[1]]
## current_1$RowNr <- c(1:nrow(current_1))
## current_1$Ideal <- c(dt_ideal$Pitch, rep(NA, abs(nrow(current_1) - nrow(dt_ideal))))
## graph(current_1)
## 
## # remove one note
## current_1 <- edit(current_1, dt_ideal)
## current_1$Ideal <- dt_ideal$Pitch
## graph(current_1)
## 
## # corrected the second error (substituted note)
## current_1 <- edit(current_1, dt_ideal)
## graph(current_1)
## 
## error_ind_offset$CorrectionNr[1] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_2 <- dt_offset[SubNr == error_ind_offset$SubNr[2] & TrialNr == error_ind_offset$TrialNr[2]]
## current_2$RowNr <- c(1:nrow(current_2))
## current_2$Ideal <- c(dt_ideal$Pitch, rep(NA, abs(nrow(current_2) - nrow(dt_ideal))))
## graph(current_2)
## 
## # correct two notes
## current_2 <- edit(current_2, dt_ideal)
## graph(current_2)
## 
## # remove one note
## current_2 <- edit(current_2, dt_ideal)
## current_2$Ideal <- dt_ideal$Pitch
## graph(current_2)
## 
## error_ind_offset$CorrectionNr[2] <- 3


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_3 <- dt_offset[SubNr == error_ind_offset$SubNr[3] & TrialNr == error_ind_offset$TrialNr[3]]
## current_3$RowNr <- c(1:nrow(current_3))
## current_3$Ideal <- dt_ideal$Pitch[-c(71, 72)]
## graph(current_3)
## 
## # correct two notes
## current_3 <- edit(current_3, dt_ideal[-c(71, 72),])
## current_3$RowNr <- c(1:nrow(current_3))
## current_3$Ideal <- dt_ideal$Pitch[-c(71, 72)]
## graph(current_3)
## 
## # insert one notes
## current_3 <- edit(current_3, dt_ideal[-c(71, 72),])
## current_3$RowNr <- c(1:nrow(current_3))
## current_3$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_3)
## 
## # correct two notes
## current_3 <- edit(current_3, dt_ideal[-c(72),])
## current_3$RowNr <- c(1:nrow(current_3))
## current_3$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_3)
## 
## # insert one note
## current_3 <- insert_na(current_3, dt_ideal)
## current_3$RowNr <- c(1:nrow(current_3))
## current_3$Ideal <- dt_ideal$Pitch
## graph(current_3)
## 
## error_ind_offset$CorrectionNr[3] <- 6


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_4 <- dt_offset[SubNr == error_ind_offset$SubNr[4] & TrialNr == error_ind_offset$TrialNr[4]]
## current_4$RowNr <- c(1:nrow(current_4))
## current_4$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_4)
## 
## # correct two notes
## current_4 <- edit(current_4, dt_ideal[-c(72),])
## current_4$RowNr <- c(1:nrow(current_4))
## current_4$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_4)
## 
## # insert one note
## current_4 <- insert_na(current_4, dt_ideal)
## current_4$RowNr <- c(1:nrow(current_4))
## current_4$Ideal <- dt_ideal$Pitch
## graph(current_4)
## 
## error_ind_offset$CorrectionNr[4] <- 3


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_5 <- dt_offset[SubNr == error_ind_offset$SubNr[5] & TrialNr == error_ind_offset$TrialNr[5]]
## current_5$RowNr <- c(1:nrow(current_5))
## current_5$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_5)
## 
## # correct two notes
## current_5 <- edit(current_5, dt_ideal[-c(72),])
## current_5$RowNr <- c(1:nrow(current_5))
## current_5$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_5)
## 
## # insert one note
## current_5 <- insert_na(current_5, dt_ideal)
## current_5$RowNr <- c(1:nrow(current_5))
## current_5$Ideal <- dt_ideal$Pitch
## graph(current_5)
## 
## error_ind_offset$CorrectionNr[5] <- 3


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_6 <- dt_offset[SubNr == error_ind_offset$SubNr[6] & TrialNr == error_ind_offset$TrialNr[6]]
## current_6$RowNr <- c(1:nrow(current_6))
## current_6$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_6)
## 
## # insert one note
## current_6 <- insert_na(current_6, dt_ideal)
## current_6$RowNr <- c(1:nrow(current_6))
## current_6$Ideal <- dt_ideal$Pitch
## graph(current_6)
## 
## # insert one note
## current_6 <- edit(current_6, dt_ideal)
## current_6$RowNr <- c(1:nrow(current_6))
## current_6$Ideal <- c(dt_ideal$Pitch, rep(NA, abs(nrow(current_6) - nrow(dt_ideal))))
## graph(current_6)
## 
## # remove one note
## current_6 <- edit(current_6, dt_ideal)
## current_6$RowNr <- c(1:nrow(current_6))
## current_6$Ideal <- dt_ideal$Pitch
## graph(current_6)
## 
## error_ind_offset$CorrectionNr[6] <- 3


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_7 <- dt_offset[SubNr == error_ind_offset$SubNr[7] & TrialNr == error_ind_offset$TrialNr[7]]
## current_7$RowNr <- c(1:nrow(current_7))
## current_7$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_7)
## 
## # insert one note
## current_7 <- insert_na(current_7, dt_ideal)
## current_7$RowNr <- c(1:nrow(current_7))
## current_7$Ideal <- dt_ideal$Pitch
## graph(current_7)
## 
## # correct four notes
## current_7 <- edit(current_7, dt_ideal)
## current_7$RowNr <- c(1:nrow(current_7))
## current_7$Ideal <- dt_ideal$Pitch
## graph(current_7)
## 
## error_ind_offset$CorrectionNr[7] <- 5


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_8 <- dt_offset[SubNr == error_ind_offset$SubNr[8] & TrialNr == error_ind_offset$TrialNr[8]]
## current_8$RowNr <- c(1:nrow(current_8))
## current_8$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_8)
## 
## # correct two notes
## current_8 <- edit(current_8, dt_ideal[-c(72),])
## current_8$RowNr <- c(1:nrow(current_8))
## current_8$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_8)
## 
## # insert one note
## current_8 <- insert_na(current_8, dt_ideal)
## current_8$RowNr <- c(1:nrow(current_8))
## current_8$Ideal <- dt_ideal$Pitch
## graph(current_8)
## 
## error_ind_offset$CorrectionNr[8] <- 3


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_9 <- dt_offset[SubNr == error_ind_offset$SubNr[9] & TrialNr == error_ind_offset$TrialNr[9]]
## current_9$RowNr <- c(1:nrow(current_9))
## current_9$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_9)
## 
## # correct two notes
## current_9 <- edit(current_9, dt_ideal[-c(72),])
## current_9$RowNr <- c(1:nrow(current_9))
## current_9$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_9)
## 
## # insert one note
## current_9 <- insert_na(current_9, dt_ideal)
## current_9$RowNr <- c(1:nrow(current_9))
## current_9$Ideal <- dt_ideal$Pitch
## graph(current_9)
## 
## error_ind_offset$CorrectionNr[9] <- 3


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_10 <- dt_offset[SubNr == error_ind_offset$SubNr[10] & TrialNr == error_ind_offset$TrialNr[10]]
## current_10$RowNr <- c(1:nrow(current_10))
## current_10$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_10)
## 
## # correct two notes
## current_10 <- edit(current_10, dt_ideal[-c(72),])
## current_10$RowNr <- c(1:nrow(current_10))
## current_10$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_10)
## 
## # insert one note
## current_10 <- insert_na(current_10, dt_ideal)
## current_10$RowNr <- c(1:nrow(current_10))
## current_10$Ideal <- dt_ideal$Pitch
## graph(current_10)
## 
## error_ind_offset$CorrectionNr[10] <- 3


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_11 <- dt_offset[SubNr == error_ind_offset$SubNr[11] & TrialNr == error_ind_offset$TrialNr[11]]
## current_11$RowNr <- c(1:nrow(current_11))
## current_11$Ideal <- dt_ideal$Pitch
## graph(current_11)
## 
## # remove one note
## current_11 <- edit(current_11, dt_ideal)
## current_11$RowNr <- c(1:nrow(current_11))
## current_11$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_11)
## 
## # insert one note
## current_11 <- insert_na(current_11, dt_ideal)
## current_11$RowNr <- c(1:nrow(current_11))
## current_11$Ideal <- dt_ideal$Pitch
## graph(current_11)
## 
## error_ind_offset$CorrectionNr[11] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_12 <- dt_offset[SubNr == error_ind_offset$SubNr[12] & TrialNr == error_ind_offset$TrialNr[12]]
## current_12$RowNr <- c(1:nrow(current_12))
## current_12$Ideal <- dt_ideal$Pitch
## graph(current_12)
## 
## # insert one note
## current_12 <- edit(current_12, dt_ideal)
## current_12$RowNr <- c(1:nrow(current_12))
## current_12$Ideal <- c(dt_ideal$Pitch, rep(NA, abs(nrow(current_12) - nrow(dt_ideal))))
## graph(current_12)
## 
## # remove one note
## current_12 <- edit(current_12, dt_ideal)
## current_12$RowNr <- c(1:nrow(current_12))
## current_12$Ideal <- dt_ideal$Pitch
## graph(current_12)
## 
## error_ind_offset$CorrectionNr[12] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_13 <- dt_offset[SubNr == error_ind_offset$SubNr[13] & TrialNr == error_ind_offset$TrialNr[13]]
## current_13$RowNr <- c(1:nrow(current_13))
## current_13$Ideal <- dt_ideal$Pitch
## graph(current_13)
## 
## # remove one note
## current_13 <- edit(current_13, dt_ideal)
## current_13$RowNr <- c(1:nrow(current_13))
## current_13$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_13)
## 
## # insert one note
## current_13 <- insert_na(current_13, dt_ideal)
## current_13$RowNr <- c(1:nrow(current_13))
## current_13$Ideal <- dt_ideal$Pitch
## graph(current_13)
## 
## error_ind_offset$CorrectionNr[13] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_14 <- dt_offset[SubNr == error_ind_offset$SubNr[14] & TrialNr == error_ind_offset$TrialNr[14]]
## current_14$RowNr <- c(1:nrow(current_14))
## current_14$Ideal <- dt_ideal$Pitch
## graph(current_14)
## 
## # remove one note
## current_14 <- edit(current_14, dt_ideal)
## current_14$RowNr <- c(1:nrow(current_14))
## current_14$Ideal <- dt_ideal$Pitch[-c(72)]
## graph(current_14)
## 
## # insert one note
## current_14 <- insert_na(current_14, dt_ideal)
## current_14$RowNr <- c(1:nrow(current_14))
## current_14$Ideal <- dt_ideal$Pitch
## graph(current_14)
## 
## error_ind_offset$CorrectionNr[14] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## current_15 <- dt_offset[SubNr == error_ind_offset$SubNr[15] & TrialNr == error_ind_offset$TrialNr[15]]
## current_15$RowNr <- c(1:nrow(current_15))
## current_15$Ideal <- dt_ideal$Pitch
## graph(current_15)
## 
## # insert one note
## current_15 <- edit(current_15, dt_ideal)
## current_15$RowNr <- c(1:nrow(current_15))
## current_15$Ideal <- c(dt_ideal$Pitch, rep(NA, abs(nrow(current_15) - nrow(dt_ideal))))
## graph(current_15)
## 
## # remove one note
## current_15 <- edit(current_15, dt_ideal)
## current_15$RowNr <- c(1:nrow(current_15))
## current_15$Ideal <- dt_ideal$Pitch
## graph(current_15)
## 
## error_ind_offset$CorrectionNr[15] <- 2


## ---- include = FALSE, eval = FALSE-------------------------------------------
## dt_correct_offset_5 <- rbind(current_1, current_2, current_3, current_4, current_5, current_6, current_7, current_8, current_9, current_10, current_11, current_12, current_13, current_14, current_15)
## dt_correct_offset_5 <- dt_correct_offset_5[, -c(5:6)]
## 
## # export csv
## fwrite(dt_correct_offset_5, file = here("filtered", "dt_correct_offset_5.txt"))
## fwrite(error_ind_offset, file = here("filtered", "error_ind_offset.txt"))


## ---- echo = FALSE------------------------------------------------------------
error_ind_offset <- fread(here("filtered", "error_ind_offset.txt"))
error_ind_offset


## ---- include = FALSE---------------------------------------------------------
dt_correct_onset_1 <- fread(here("filtered", "dt_correct_onset_1.txt"))
dt_correct_onset_2 <- fread(here("filtered", "dt_correct_onset_2.txt"))
dt_correct_onset_3 <- fread(here("filtered", "dt_correct_onset_3.txt"))
dt_correct_onset_4 <- fread(here("filtered", "dt_correct_onset_4.txt"))
dt_correct_onset_5 <- fread(here("filtered", "dt_correct_onset_5.txt"))

# combine all
dt_correct_onset <- rbind(dt_correct_onset_1, dt_correct_onset_2, dt_correct_onset_3, dt_correct_onset_4, dt_correct_onset_5)

# export csv
fwrite(dt_correct_onset, file = here("filtered", "dt_correct_onset.txt"))

dt_correct_offset_1 <- fread(here("filtered", "dt_correct_offset_1.txt"))
dt_correct_offset_2 <- fread(here("filtered", "dt_correct_offset_2.txt"))
dt_correct_offset_3 <- fread(here("filtered", "dt_correct_offset_3.txt"))
dt_correct_offset_4 <- fread(here("filtered", "dt_correct_offset_4.txt"))
dt_correct_offset_5 <- fread(here("filtered", "dt_correct_offset_5.txt"))

# combine all
dt_correct_offset <- rbind(dt_correct_offset_1, dt_correct_offset_2, dt_correct_offset_3, dt_correct_offset_4, dt_correct_offset_5)

# export csv
fwrite(dt_correct_offset, file = here("filtered", "dt_correct_offset.txt"))


## ---- include = FALSE---------------------------------------------------------
extra_onset <- sum(as.numeric(error_extra_onset[CorrectionNr != "Check individually"]$CorrectionNr))
extra_offset <- sum(as.numeric(error_extra_offset[CorrectionNr != "Check individually"]$CorrectionNr))
missing_onset <- sum(as.numeric(error_missing_onset[CorrectionNr != "Check individually"]$CorrectionNr))
missing_offset <- sum(as.numeric(error_missing_offset[CorrectionNr != "Check individually"]$CorrectionNr))
sub_onset <- sum(as.numeric(error_sub_onset[CorrectionNr != "Check individually"]$CorrectionNr))
sub_offset <- sum(as.numeric(error_sub_offset[CorrectionNr != "Check individually"]$CorrectionNr))
mixed_onset <- sum(as.numeric(error_ind_onset$CorrectionNr))
mixed_offset <- sum(as.numeric(error_ind_offset$CorrectionNr))


## ----export, include = FALSE--------------------------------------------------
knitr::purl("filtering.Rmd")

