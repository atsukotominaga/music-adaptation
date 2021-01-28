# /usr/local/bin/r
# Average duration & key velocity for averaged expressive performance
# Created: 17/06/2020

# packages
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}

# function
source("../function.R")

# create a folder to store stimuli
foldername = paste(format(Sys.time(), "%s-%d%m%y"), "/", sep = "") # current time
dir.create(foldername)

# file location
# 1. data from stim_n (tempo - already created data in low)
filename_ioi = "../low/1596207520-310720/dt_ioi_instance.txt"
# 2. data from stim_a (articulation, dynamics - already created data in art/dyn)
filename_du = "../art/1596379937-020820/dt_du_instance.txt"
filename_kv = "../dyn/1596379899-020820/dt_kv_instance.txt"

# read csv/txt
# 1. use normative performance for ioi
dt_ioi_instance <- fread(filename_ioi, header = T, sep = ",", dec = ".")
# 2. use performing performance for duration, kv
dt_du_instance <- fread(filename_du, header = T, sep = ",", dec = ".")
dt_kv_instance <- fread(filename_kv, header = T, sep = ",", dec = ".")
# ideal
dt_ideal <- fread("../ideal.txt", header = F)

### create playback data for 16 instances! ###
# 1. determine onsets/offsets
# onsets
dt_playback_onset <- dt_ioi_instance[, c("Instance", "RowNr")]
dt_playback_onset$Key_OnOff <- 1
for (i in 1:nrow(dt_playback_onset)){
  if (dt_playback_onset$RowNr[i] == 1){
    dt_playback_onset$TimeStamp[i] <- 0
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
for (i in 1:16){
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
