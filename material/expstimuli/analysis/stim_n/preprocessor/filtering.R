#!/usr/local/bin/R
#rm(list=ls(all=T)) - clear all in Grobal Environment

####################################
#  Documentation
####################################
# Created: 02/04/2020
# This script organises raw data and removes pitch errors.

# set working directory
if (!require("here")) {install.packages("here"); require("here")}
here::i_am("filtering.R")

####################################
#  Requirements
####################################
# set working directory to file source location
# install and load required packages
if (!require("data.table")) {install.packages("data.table"); require("data.table")}

# read functions
source("./function.R")

# create necessary folders if not exist
# filtered - all of the outputs will be stored in this folder
if (!file.exists("filtered")){
  dir.create("filtered")
}

# read a text file for ideal performance
dt_ideal <- fread("./ideal.txt")
colnames(dt_ideal) <- "Pitch"
dt_ideal$RowNr <- c(1:nrow(dt_ideal))

# create a list of data file names
lf <- list.files("./practice", pattern = "txt")

# create raw_data - merge all data files into one
raw_data <- data.table()
for (i in 1:length(lf)){
  data_i <- read.csv(file.path("./practice", lf[i]), header = F, sep = " ", dec = ".")
  raw_data <- rbind(raw_data, data_i)
}

# add column namesls
colnames(raw_data) <- c("NoteNr", "TimeStamp", "Pitch", "Velocity", "Key_OnOff", "Device", "Tempo",
                        "SubNr", "BlockNr", "TrialNr", "Skill", "Condition", "Image")

# clean raw_data
raw_data$NoteNr <- as.numeric(gsub(",", "", raw_data$NoteNr))
raw_data$Image <- gsub(";", "", raw_data$Image)

# sort by SubNr, BlockNr, TrialNr
raw_data <- raw_data[order(raw_data$SubNr, raw_data$BlockNr, raw_data$TrialNr),]

# separate raw_data into each skill
dt_stim_n <- raw_data[BlockNr == 0] # non-expressive sheet music
dt_stim_a <- raw_data[Skill == "articulation"]
dt_stim_d <- raw_data[Skill == "dynamics"]

####################################
# Detect pitch errors
####################################
# raw_data without metronome
dt_all <- dt_stim_n[Pitch != 31 & Pitch != 34]

# onset and offset
dt_onset <- dt_all[Key_OnOff == 1]
dt_offset <- dt_all[Key_OnOff == 0]

####################################
# ONSET
####################################
# detect pitch errors
ls_error_onset  <- pitch_remover(dt_onset, dt_ideal)

# mark trials with errors by the first filtering
dt_onset$Error <- 0
for (error in 1:length(ls_error_onset)){
  dt_onset[SubNr == ls_error_onset[[error]][1] & TrialNr == ls_error_onset[[error]][2]]$Error <- 1
}

dt_correct_onset <- dt_onset[Error == 0]

####################################
# OFFSET
####################################
# detect pitch errors
ls_error_offset  <- pitch_remover(dt_offset, dt_ideal)

# mark trials with errors by the first filtering
dt_offset$Error <- 0
for (error in 1:length(ls_error_offset)){
  dt_offset[SubNr == ls_error_offset[[error]][1] & TrialNr == ls_error_offset[[error]][2]]$Error <- 1
}

dt_correct_offset <- dt_offset[Error == 0]

####################################
# Export csv files
####################################
# Export corrected onset/offset for stim_n
write.csv(dt_correct_onset, file = "./filtered/data_onset.csv", row.names = F)
write.csv(dt_correct_offset, file = "./filtered/data_offset.csv", row.names = F)

# check whether there is still error
pitch_remover(dt_correct_onset, dt_ideal)
pitch_remover(dt_correct_offset, dt_ideal)
