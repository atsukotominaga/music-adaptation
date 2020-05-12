# /usr/local/bin/r
# Average onset, duration, key velocity for normative performance
# Created: 06/05/2020

# packages
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}
# plot
if (!require("ggplot2")) {install.packages("ggplot2"); require("ggplot2")}

# setup
## ggplots
theme_set(theme_classic())
theme_update(text = element_text(size = 20, family = "Helvetica Neue LT Std 57 Condensed"), legend.position = "bottom")
## function
source("./function.R")

# read csv/txt
dt_onset <- fread("../analysis/stim_n/preprocessor/filtered/data_onset.csv", header = T, sep = ",", dec = ".")
dt_offset <- fread("../analysis/stim_n/preprocessor/filtered/data_offset.csv", header = T, sep = ",", dec = ".")
#onset_valid <- fread("../analysis/stim_n/onset_valid.csv", header = T, sep = ",", dec = ".")
#offset_valid <- fread("../analysis/stim_n/offset_valid.csv", header = T, sep = ",", dec = ".")
duration_valid <- fread("../analysis/stim_n/duration_valid.csv", header = T, sep = ",", dec = ".")
kv_valid <- fread("../analysis/stim_n/kv_valid.csv", header = T, sep = ",", dec = ".")
dt_ideal <- fread("./ideal.txt", header = F)

# duration and kv
valid_du_kv <- rbind(duration_valid[, c("SubNr", "TrialNr")], kv_valid[, c("SubNr", "TrialNr")])
valid_du_kv$Duplicated <- duplicated(valid_du_kv)

# valid performances
valid <- valid_du_kv[Duplicated == TRUE]

### create 6 instances! ###
valid$Sample <- sample(c(1:31), replace = FALSE)
print(valid)
fwrite(valid, "./valid.txt")

# 1. average IOIs
dt_ioi_instance  <- data.table()
counter = 0
for (i in 1:6){
  stim <- combining_onset(valid, i)
  
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
  counter = counter+4
  }

# 2. average duration
dt_du_instance <- data.table()
counter = 0
for (i in c(1:6)){
  stim <- combining_onset(valid, i) #onset
  stim_offset <- combining_offset(valid, i)
  
  # calculate Duration
  stim$Duration <- stim_offset$TimeStamp - stim$TimeStamp
  stim$normDu <- stim$Duration/stim$Tempo
  
  # average normDu
  stim_average <- stim[, .(N = length(normDu), Mean = mean(normDu), SD = sd(normDu)), by = .(RowNr)]
  # label instance no
  stim_average$Instance <- as.character(i)
  # add to dt_du_instance
  dt_du_instance <- rbind(dt_du_instance, stim_average)
  
  # next instance
  counter = counter+4
}

# 3. average kv
dt_kv_instance <- data.table()
counter = 0
for (i in c(1:6)){
  stim <- combining_onset(valid, i)
  
  # average KV
  stim_average <- stim[, .(N = length(Velocity), Mean = mean(Velocity), SD = sd(Velocity)), by = .(RowNr)]
  # label instance no
  stim_average$Instance <- as.character(i)
  # add to dt_du_instance
  dt_kv_instance <- rbind(dt_kv_instance, stim_average)
  
  # next instance
  counter = counter+4
}

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
for (i in 1:6){
  onset <- dt_playback_onset[Instance == i]
  offset <- dt_playback_offset[Instance == i]
  onset$Pitch <- dt_ideal$V1
  offset$Pitch <- dt_ideal$V1
  instance <- rbind(onset, offset)
  # sort by TimeStamp
  instance <- instance[order(TimeStamp)]
  
  # export txt
  filename = paste("./", i, "_instance.txt", sep = "")
  fwrite(instance, filename)
}
