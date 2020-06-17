# /usr/local/bin/r
# Average key velocity for averaged expressive performance
# Created: 06/05/2020

# packages
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}

# function
source("./function.R")

# create a folder to store stimuli
foldername = paste(format(Sys.time(), "%s-%d%m%y"), "/", sep = "") # current time
dir.create(foldername)

# read csv/txt
dt_onset <- fread("../analysis/expression/filtered/data_onset.csv", header = T, sep = ",", dec = ".")
dt_offset <- fread("../analysis/expression/filtered/data_offset.csv", header = T, sep = ",", dec = ".")
# only for performing/articulation
dt_onset <- dt_onset[Condition == "performing" & Skill == "dynamics"]
dt_offset <- dt_offset[Condition == "performing" & Skill == "dynamics"]
# use normative performance for ioi, duration
dt_ioi_instance <- fread("../stim_n/20_21/1589957466-200520/dt_ioi_instance.txt", header = T, sep = ",", dec = ".")
dt_du_instance <- fread("../stim_n/20_21/1589957466-200520/dt_du_instance.txt", header = T, sep = ",", dec = ".")
# use performing performance for kv
kv_valid <- fread("../analysis/expression/stim_d/kv_valid.csv", header = T, sep = ",", dec = ".")
dt_ideal <- fread("./ideal.txt", header = F)

# valid kv performances
valid <- kv_valid[, c("SubNr", "TrialNr")]

### create 8 instances! ###
valid$Sample <- sample(c(1:nrow(valid)), replace = FALSE)
print(valid)
fwrite(valid, paste(foldername, "valid.txt", sep = ""))

# 1. average kv
dt_kv_instance <- data.table()
counter = 0
for (i in c(1:8)){
  stim <- combining_onset(valid, i)
  
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
