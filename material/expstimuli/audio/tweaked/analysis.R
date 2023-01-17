## ----packages, include = FALSE------------------------------------------------
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}
# midi
if (!require("tuneR")) {install.packages("tuneR"); require("tuneR")}
# plot
if (!require("ggpubr")) {install.packages("ggpubr"); require("ggpubr")}


## ----midi, include = FALSE----------------------------------------------------
# create a list of data file names
lf <- list.files("../selected/mid/", pattern = "mid")

# combine data
all_data <- data.table()
for (file in lf){
   current <- readMidi(paste("../selected/mid/", file, sep = ""))
   current$MidFile <- gsub(".mid", "", file)
   all_data <- rbind(all_data, current)
}

data <- all_data[event == "Note On" | event == "Note Off"]
data$NoteNr <- rep(1:144, nrow(data)/144)
data$channel <- NULL
data$parameterMetaSystem <- NULL
data$track <- NULL
data$type <- NULL

# labelling
colnames(data)[c(3,4)] <- c("Pitch", "Velocity") # time event also change
data$SubArt <- "NA"
data$SubDyn <- "NA"
data$MidFileShort <- gsub("art_only", "a", data$MidFile)
data$MidFileShort <- gsub("dyn_only", "d", data$MidFileShort)
data$MidFileShort <- gsub("high", "h", data$MidFileShort)
data$MidFileShort <- gsub("low", "l", data$MidFileShort)

# define subcomponents
# for intervals
ls_legato <- list(c(1:4), c(9:16), c(21:24), c(40:46))
ls_staccato <- list(c(6:7), c(18:19), c(29:31), c(36:38), c(48:50), c(53:55), c(58:64))
ls_forte <- list(c(1:4), c(9:16), c(21:24), c(40:46))
ls_piano <- list(c(6:7), c(18:19), c(29:31), c(36:38), c(48:50), c(53:55), c(58:64))

# for each note (velocity)
ls_legato_2 <- list(c(1:5), c(9:17), c(21:26), c(40:47))
ls_staccato_2 <- list(c(6:8), c(18:20), c(29:32), c(36:39), c(48:51), c(53:56), c(58:65))
ls_forte_2 <- list(c(1:5), c(9:17), c(21:26), c(40:47))
ls_piano_2 <- list(c(6:8), c(18:20), c(29:32), c(36:39), c(48:51), c(53:56), c(58:65))

# define Component Change (LtoS, FtoP)
change_1 <- c(5, 17, 47)
# define Component Change (StoL, PtoF)
change_2 <- c(8, 20, 39)


## ----ioi, include = FALSE-----------------------------------------------------
data_onset <- data[event == "Note On"]
data_offset <- data[event == "Note Off"]

data_onset$IOI <- diff(c(0, data_onset$time))
dt_ioi <- data_onset[NoteNr != 1]
dt_ioi$Interval <- rep(1:71, nrow(dt_ioi)/71)

# assign Subcomponents
# Legato
for (phrase in 1:length(ls_legato)){
 for (note in 1:length(ls_legato[[phrase]])){
   dt_ioi[Interval == ls_legato[[phrase]][note]]$SubArt <- "Legato"
 }
}
# Staccato
for (phrase in 1:length(ls_staccato)){
 for (note in 1:length(ls_staccato[[phrase]])){
   dt_ioi[Interval == ls_staccato[[phrase]][note]]$SubArt <- "Staccato"
 }
}

# Forte
for (phrase in 1:length(ls_forte)){
 for (note in 1:length(ls_forte[[phrase]])){
   dt_ioi[Interval == ls_legato[[phrase]][note]]$SubDyn <- "Forte"
 }
}
# Piano
for (phrase in 1:length(ls_piano)){
 for (note in 1:length(ls_piano[[phrase]])){
   dt_ioi[Interval == ls_staccato[[phrase]][note]]$SubDyn <- "Piano"
 }
}

# assign Subcomponent Change
for (number in change_1){
 dt_ioi[Interval == number]$SubArt <- "LtoS"
 dt_ioi[Interval == number]$SubDyn <- "FtoP"
}
for (number in change_2){
 dt_ioi[Interval == number]$SubArt <- "StoL"
 dt_ioi[Interval == number]$SubDyn <- "PtoF"
}


## ----ioi-distribution, echo = FALSE-------------------------------------------
# change labelling
dt_ioi[MidFile == "high_1"]$MidFile <- "both_1"
dt_ioi[MidFile == "high_2"]$MidFile <- "both_2"
dt_ioi[MidFile == "high_3"]$MidFile <- "both_3"
dt_ioi[MidFile == "high_4"]$MidFile <- "both_4"
dt_ioi[MidFile == "low_1"]$MidFile <- "none_1"
dt_ioi[MidFile == "low_2"]$MidFile <- "none_2"
dt_ioi[MidFile == "low_3"]$MidFile <- "none_3"
dt_ioi[MidFile == "low_4"]$MidFile <- "none_4"

gghistogram(dt_ioi[SubArt != "NA"], x = "IOI", facet.by = "MidFile", bins = 50, rug = TRUE)


## ----ioi-mean, echo = FALSE---------------------------------------------------
# mean
dt_ioi[SubArt != "NA", .(N = .N, Mean = mean(IOI), SD = sd(IOI)), "MidFile"]

ggboxplot(dt_ioi[SubArt != "NA"], x = "MidFileShort", y = "IOI", add = "jitter", width = 0.8) + geom_hline(yintercept = 300, linetype = "dashed", color = "red")


## ----kot, include = FALSE-----------------------------------------------------
data_onset$KOT <- NA
for (row in 1:nrow(data_onset)){
   if (row < nrow(data_onset)){
      data_onset$KOT[row+1] <- data_offset$time[row] - data_onset$time[row+1] # offset(n) - onset(n+1)
   }
}

dt_kot <- data_onset[NoteNr != 1]
dt_kot$Interval <- rep(1:71, nrow(dt_kot)/71)

# assign Subcomponents
# Legato
for (phrase in 1:length(ls_legato)){
 for (note in 1:length(ls_legato[[phrase]])){
   dt_kot[Interval == ls_legato[[phrase]][note]]$SubArt <- "Legato"
 }
}
# Staccato
for (phrase in 1:length(ls_staccato)){
 for (note in 1:length(ls_staccato[[phrase]])){
   dt_kot[Interval == ls_staccato[[phrase]][note]]$SubArt <- "Staccato"
 }
}

# Forte
for (phrase in 1:length(ls_forte)){
 for (note in 1:length(ls_forte[[phrase]])){
   dt_kot[Interval == ls_legato[[phrase]][note]]$SubDyn <- "Forte"
 }
}
# Piano
for (phrase in 1:length(ls_piano)){
 for (note in 1:length(ls_piano[[phrase]])){
   dt_kot[Interval == ls_staccato[[phrase]][note]]$SubDyn <- "Piano"
 }
}

# assign Subcomponent Change
for (number in change_1){
 dt_kot[Interval == number]$SubArt <- "LtoS"
 dt_kot[Interval == number]$SubDyn <- "FtoP"
}
for (number in change_2){
 dt_kot[Interval == number]$SubArt <- "StoL"
 dt_kot[Interval == number]$SubDyn <- "PtoF"
}


## ----kot-distribution, echo = FALSE-------------------------------------------
# change labelling
dt_kot[MidFile == "high_1"]$MidFile <- "both_1"
dt_kot[MidFile == "high_2"]$MidFile <- "both_2"
dt_kot[MidFile == "high_3"]$MidFile <- "both_3"
dt_kot[MidFile == "high_4"]$MidFile <- "both_4"
dt_kot[MidFile == "low_1"]$MidFile <- "none_1"
dt_kot[MidFile == "low_2"]$MidFile <- "none_2"
dt_kot[MidFile == "low_3"]$MidFile <- "none_3"
dt_kot[MidFile == "low_4"]$MidFile <- "none_4"

gghistogram(dt_kot[SubArt != "NA" & SubArt != "LtoS" & SubArt != "StoL"], x = "KOT", color = "SubArt", facet.by = "MidFile", bins = 50, rug = TRUE)


## ----kot-mean, echo = FALSE---------------------------------------------------
# mean
dt_kot[SubArt != "NA", .(N = .N, Mean = mean(KOT), SD = sd(KOT)), by = .(MidFile, SubArt)]

ggboxplot(dt_kot[SubArt != "NA"], x = "MidFileShort", y = "KOT", color = "SubArt", add = "jitter", width = 0.8)


## ----kot-tweak, echo = FALSE--------------------------------------------------
# grandMean of art_only & both stimuli
kot_grandMean <- mean(dt_kot[grepl("art_only", MidFile) | grepl("both", MidFile) & SubArt != "NA"]$KOT)

# calculate the diff between each KOT mean and grandMean
tweak_data <- dt_kot[grepl("dyn_only", MidFile) | grepl("none", MidFile) & SubArt != "NA", .(N = .N, Mean = mean(KOT), SD = sd(KOT)), by = .(MidFile)]
tweak_data$Diff <- round(abs(tweak_data$Mean-kot_grandMean), 0)
tweak_data

# add each fixed Diff value to TimeStamp
dt_kot$FixedKOT <- dt_kot$KOT
for (midfile in unique(tweak_data$MidFile)){
   dt_kot[MidFile == midfile]$FixedKOT <- dt_kot[MidFile == midfile]$KOT+tweak_data[MidFile == midfile]$Diff
}


## ----kot-distribution-fixed, echo = FALSE-------------------------------------
gghistogram(dt_kot[SubArt != "NA" & SubArt != "LtoS" & SubArt != "StoL"], x = "FixedKOT", color = "SubArt", facet.by = "MidFile", bins = 50, rug = TRUE)


## ----kot-mean-fixed, echo = FALSE---------------------------------------------
# mean
dt_kot[SubArt != "NA", .(N = .N, Mean = mean(FixedKOT), SD = sd(FixedKOT)), by = .(MidFile, SubArt)]

ggboxplot(dt_kot[SubArt != "NA"], x = "MidFileShort", y = "FixedKOT", color = "SubArt", add = "jitter", width = 0.8)


## ----vel, include = FALSE-----------------------------------------------------
dt_vel <- data_onset
dt_vel$NoteOnsetNr <- rep(1:72, nrow(dt_vel)/72)
# assign Subcomponents
# for each note
# Legato
for (phrase in 1:length(ls_legato_2)){
   for (note in 1:length(ls_legato_2[[phrase]])){
     dt_vel[NoteOnsetNr == ls_legato_2[[phrase]][note]]$SubArt <- "Legato"
   }
}
# Staccato
for (phrase in 1:length(ls_staccato_2)){
   for (note in 1:length(ls_staccato_2[[phrase]])){
     dt_vel[NoteOnsetNr == ls_staccato_2[[phrase]][note]]$SubArt <- "Staccato"
   }
}
# Forte
for (phrase in 1:length(ls_forte_2)){
   for (note in 1:length(ls_forte_2[[phrase]])){
     dt_vel[NoteOnsetNr == ls_forte_2[[phrase]][note]]$SubDyn <- "Forte"
   }
}
# Piano
for (phrase in 1:length(ls_piano_2)){
   for (note in 1:length(ls_piano_2[[phrase]])){
     dt_vel[NoteOnsetNr == ls_piano_2[[phrase]][note]]$SubDyn <- "Piano"
   }
}


## ----vel-distribution, echo = FALSE-------------------------------------------
# change labelling
dt_vel[MidFile == "high_1"]$MidFile <- "both_1"
dt_vel[MidFile == "high_2"]$MidFile <- "both_2"
dt_vel[MidFile == "high_3"]$MidFile <- "both_3"
dt_vel[MidFile == "high_4"]$MidFile <- "both_4"
dt_vel[MidFile == "low_1"]$MidFile <- "none_1"
dt_vel[MidFile == "low_2"]$MidFile <- "none_2"
dt_vel[MidFile == "low_3"]$MidFile <- "none_3"
dt_vel[MidFile == "low_4"]$MidFile <- "none_4"

gghistogram(dt_vel[SubArt != "NA"], x = "Velocity", facet.by = "MidFile", color = "SubDyn", bins = 50, rug = TRUE)


## ----vel-mean, echo = FALSE---------------------------------------------------
# mean
dt_vel[SubDyn != "NA", .(N = .N, Mean = mean(Velocity), SD = sd(Velocity)), by = .(MidFile, SubDyn)]

ggboxplot(dt_vel[SubArt != "NA"], x = "MidFileShort", y = "Velocity", color = "SubDyn", add = "jitter", width = 0.8)


## ----vel-diff, include = FALSE------------------------------------------------
data_onset$Diff <- diff(c(0, data_onset$Velocity))
dt_vel_diff <- data_onset[NoteNr != 1]
# assign Interval
dt_vel_diff$Interval <- rep(1:71, nrow(dt_vel_diff)/71)

# assign Subcomponents
# Legato
for (phrase in 1:length(ls_legato)){
 for (note in 1:length(ls_legato[[phrase]])){
   dt_vel_diff[Interval == ls_legato[[phrase]][note]]$SubArt <- "Legato"
 }
}
# Staccato
for (phrase in 1:length(ls_staccato)){
 for (note in 1:length(ls_staccato[[phrase]])){
   dt_vel_diff[Interval == ls_staccato[[phrase]][note]]$SubArt <- "Staccato"
 }
}

# Forte
for (phrase in 1:length(ls_forte)){
 for (note in 1:length(ls_forte[[phrase]])){
   dt_vel_diff[Interval == ls_legato[[phrase]][note]]$SubDyn <- "Forte"
 }
}
# Piano
for (phrase in 1:length(ls_piano)){
 for (note in 1:length(ls_piano[[phrase]])){
   dt_vel_diff[Interval == ls_staccato[[phrase]][note]]$SubDyn <- "Piano"
 }
}

# assign Subcomponent Change
for (number in change_1){
 dt_vel_diff[Interval == number]$SubArt <- "LtoS"
 dt_vel_diff[Interval == number]$SubDyn <- "FtoP"
}
for (number in change_2){
 dt_vel_diff[Interval == number]$SubArt <- "StoL"
 dt_vel_diff[Interval == number]$SubDyn <- "PtoF"
}


## ----vel-diff-distribution, echo = FALSE--------------------------------------
# change labelling
dt_vel_diff[MidFile == "high_1"]$MidFile <- "both_1"
dt_vel_diff[MidFile == "high_2"]$MidFile <- "both_2"
dt_vel_diff[MidFile == "high_3"]$MidFile <- "both_3"
dt_vel_diff[MidFile == "high_4"]$MidFile <- "both_4"
dt_vel_diff[MidFile == "low_1"]$MidFile <- "none_1"
dt_vel_diff[MidFile == "low_2"]$MidFile <- "none_2"
dt_vel_diff[MidFile == "low_3"]$MidFile <- "none_3"
dt_vel_diff[MidFile == "low_4"]$MidFile <- "none_4"

gghistogram(dt_vel_diff[SubDyn == "FtoP" | SubDyn == "PtoF"], x = "Diff", facet.by = "MidFile", color = "SubDyn", bins = 50, rug = TRUE)


## ----vel-diff-mean, echo = FALSE----------------------------------------------
# mean
dt_vel_diff[SubDyn == "FtoP" | SubDyn == "PtoF", .(N = .N, Mean = mean(Diff), SD = sd(Diff)), by = .(MidFile, SubDyn)]

ggboxplot(dt_vel_diff[SubDyn == "FtoP" | SubDyn == "PtoF"], x = "MidFileShort", y = "Diff", color = "SubDyn", add = "jitter", width = 0.8)


## ----export, include = FALSE--------------------------------------------------
knitr::purl("analysis.Rmd")

