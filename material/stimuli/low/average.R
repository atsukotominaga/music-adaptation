# /usr/local/bin/r
# Average onset, duration, key velocity for normative performance
# Created: 06/05/2020

# packages
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}

# function
source("./function.R")

# create a folder to store stimuli
foldername = paste(format(Sys.time(), "%s-%d%m%y"), "/", sep = "") # current time
dir.create(foldername)

# file location
filename_onset = "../../analysis/stim_n/preprocessor/filtered/data_onset.csv"
filename_offset = "../../analysis/stim_n/preprocessor/filtered/data_offset.csv"
filename_valid_on = "../../analysis/stim_n/onset_valid.csv"
filename_valid_off = "../../analysis/stim_n/offset_valid.csv"
filename_valid_du = "../../analysis/stim_n/duration_valid.csv"
filename_valid_kv = "../../analysis/stim_n/kv_valid.csv"

# read csv/txt
dt_onset <- fread(filename_onset, header = T, sep = ",", dec = ".")
dt_offset <- fread(filename_offset, header = T, sep = ",", dec = ".")
# onset_valid <- fread(filename_valid_on, header = T, sep = ",", dec = ".")
# offset_valid <- fread(filename_valid_off, header = T, sep = ",", dec = ".")
duration_valid <- fread(filename_valid_du, header = T, sep = ",", dec = ".")
kv_valid <- fread(filename_valid_kv, header = T, sep = ",", dec = ".")
dt_ideal <- fread("./ideal.txt", header = F)

# duration and kv (note: valid_du means that both onsets and offsets are valid - therefore we only consider valid_du)
valid_du_kv <- rbind(duration_valid[, c("SubNr", "TrialNr")], kv_valid[, c("SubNr", "TrialNr")])
valid_du_kv$Duplicated <- duplicated(valid_du_kv)

# valid performances
original <- valid_du_kv[Duplicated == TRUE]

### create 16 instances! ###
# use valid performances twice
valid <- rbind(original, original)
# random sampling
boo = TRUE
while (boo){
  valid$Sample <- sample(c(1:62), replace = FALSE)
  # check if each chunk with 3 examples does not contain the same performance
  valid <- valid[order(Sample),]
  valid$Checked <- NA
  counter = 0
  for (i in 1:floor(nrow(valid)/3)){
    example1 <- paste(valid$SubNr[i+counter], "-", valid$TrialNr[i], sep = "")
    example2 <- paste(valid$SubNr[i+counter+1], "-", valid$TrialNr[i+2], sep = "")
    example3 <- paste(valid$SubNr[i+counter+2], "-", valid$TrialNr[i+2], sep = "")
    # if the same performance was used twice, break the loop and restart
    if (anyDuplicated(c(example1, example2, example3)) != 0){
      boo = TRUE
      break
    } else {
      valid$Checked[i+counter] <- "No duplicates"
      valid$Checked[i+counter+1] <- "No duplicates"
      valid$Checked[i+counter+2] <- "No duplicates"
      counter = counter+2
      boo = FALSE
    }
  }
}

# export randomly sampled data
fwrite(valid, paste(foldername, "valid.txt", sep = ""))

# 1. average IOIs
dt_ioi_instance  <- data.table()
counter = 0
for (i in 1:16){
  stim <- combining_onset(dt_onset, valid, i)
  
  # calculate normIOI
  stim$IOI <- diff(c(0, stim$TimeStamp))# convert bpm to ms
  stim$normIOI <- stim$IOI/stim$Tempo
  # IOI = 0 if RowNr == 1
  stim[RowNr == 1]$normIOI <- 0
  
  # average normIOI
  stim_average <- stim[, .(N = length(normIOI), Mean = mean(normIOI), SD = sd(normIOI)), by = .(RowNr)]
  # label instance no
  stim_average$Instance <- as.character(i)
  # add to dt_ioi_instance
  dt_ioi_instance <- rbind(dt_ioi_instance, stim_average)
  
  # next instance
  counter = counter+2
  }

# export dt_ioi_instance
fwrite(dt_ioi_instance, paste(foldername, "dt_ioi_instance.txt", sep = ""))

# 2. duration (no averaging)
# only use SubNr 20 and 21
valid_duration <- data.table()
for (i in 1:4){
  valid_duration <- rbind(valid_duration, original[SubNr == 20 | SubNr == 21])
} # 16 instances (4 repetitions)

# random sampling for valid_duration
valid_duration$SampleDuration <- sample(c(1:16), replace = FALSE)
dt_du_instance <- data.table()

for (i in c(1:16)){
  subnr <- valid_duration[SampleDuration == i]$SubNr
  trialnr <- valid_duration[SampleDuration == i]$TrialNr
  stim <- dt_onset[SubNr == subnr & TrialNr == trialnr]
  stim_offset <- dt_offset[SubNr == subnr & TrialNr == trialnr]
  stim$RowNr <- rep(c(1:72))
  stim_offset$RowNr <- rep(c(1:72))
  
  # tempo labels
  stim[Tempo == 120]$Tempo <- 250
  stim[Tempo == 110]$Tempo <- 273
  stim[Tempo == 100]$Tempo <- 300
  
  # calculate Duration
  stim$Duration <- stim_offset$TimeStamp - stim$TimeStamp
  stim$normDu <- stim$Duration/stim$Tempo
  
  # average normDu (just use the same format for dt_ioi_instance, dt_kv_instance, no averaging)
  stim_average <- stim[, .(N = length(normDu), Mean = mean(normDu), SD = sd(normDu)), by = .(RowNr)]
  # label instance no
  stim_average$Instance <- as.character(i)
  # add to dt_du_instance
  dt_du_instance <- rbind(dt_du_instance, stim_average)
}

# export dt_du_instance
fwrite(dt_du_instance, paste(foldername, "dt_du_instance.txt", sep = ""))

# 3. average kv
dt_kv_instance <- data.table()
counter = 0
for (i in c(1:16)){
  stim <- combining_onset(dt_onset, valid, i)
  
  # average KV
  stim_average <- stim[, .(N = length(Velocity), Mean = mean(Velocity), SD = sd(Velocity)), by = .(RowNr)]
  # label instance no
  stim_average$Instance <- as.character(i)
  # add to dt_du_instance
  dt_kv_instance <- rbind(dt_kv_instance, stim_average)
  
  # next instance
  counter = counter+2
}

# export dt_kv_instance
fwrite(dt_kv_instance, paste(foldername, "dt_kv_instance.txt", sep = ""))

### create playback data! ###
# 1. determine onsets/offsets
# onsets
dt_playback_onset <- dt_ioi_instance[, c("Instance", "RowNr")]
dt_playback_onset$Key_OnOff <- 1
for (i in 1:nrow(dt_playback_onset)){
  if (dt_playback_onset$RowNr[i] == 1){
    dt_playback_onset$TimeStamp[i] <- 0
    print(i)
  } else {
    dt_playback_onset$TimeStamp[i] <- dt_playback_onset$TimeStamp[i-1]+dt_ioi_instance$Mean[i]
  }
}
# Tempo 100 bpm (IOI - 300ms (8th notes))
dt_playback_onset$TimeStamp <- round(dt_playback_onset$TimeStamp*300)

# offsets
dt_playback_offset <- dt_ioi_instance[, c("Instance", "RowNr")]
dt_playback_offset$Key_OnOff <- 0
# Tempo 100 bpm (IOI - 300ms (8th notes))
dt_playback_offset$TimeStamp <- round(dt_playback_onset$TimeStamp+dt_du_instance$Mean*300)

# kv
dt_playback_onset$Velocity <- round(dt_kv_instance$Mean)
dt_playback_offset$Velocity <- round(dt_kv_instance$Mean)

# create txt for each instance
for (i in 1:8){
  onset <- dt_playback_onset[Instance == i]
  offset <- dt_playback_offset[Instance == i]
  onset$Pitch <- dt_ideal$V1
  offset$Pitch <- dt_ideal$V1
  instance <- rbind(onset, offset)
  # sort by TimeStamp
  instance <- instance[order(TimeStamp)]
  
  # export txt
  filename = paste(foldername, i, "_instance.txt", sep = "")
  fwrite(instance, filename)
}
