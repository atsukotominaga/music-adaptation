# /usr/local/bin/r
# Randomly select three raw performances for practice trials
# Created: 13/08/2020

# set working directory
if (!require("here")) {install.packages("here"); require("here")}
here::i_am("random.R")

# packages
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}

# create a folder to store stimuli
foldername = paste(format(Sys.time(), "%s-%d%m%y"), "/", sep = "") # current time
dir.create(foldername)

# file location
# 1. data for raw non-expressive performances
filename_onset1 = "../analysis/stim_n/preprocessor/filtered/data_onset.csv"
filename_offset1 = "../analysis/stim_n/preprocessor/filtered/data_offset.csv"
filename_valid_du1 = "../analysis/stim_n/duration_valid.csv"
filename_valid_kv1 = "../analysis/stim_n/kv_valid.csv"
# 2. data for raw expressive performances
filename_onset2 = "../analysis/expression/filtered/data_onset.csv"
filename_offset2 = "../analysis/expression/filtered/data_offset.csv"
filename_valid_du2 = "../analysis/expression/stim_a/duration_valid.csv"
filename_valid_kv2 = "../analysis/expression/stim_d/kv_valid.csv"

# read csv/txt
# 1. non-expressive performances
dt_onset1 <- fread(filename_onset1, header = T, sep = ",", dec = ".")
dt_offset1 <- fread(filename_offset1, header = T, sep = ",", dec = ".")
# label skill as "non-expression"
dt_onset1$Skill <- as.character(dt_onset1$Condition)
dt_offset1$Skill <- as.character(dt_offset1$Condition)
dt_onset1$Skill <- "non-expression"
dt_offset1$Skill <- "non-expression"
# valid performances for each parameter
duration_valid1 <- fread(filename_valid_du1, header = T, sep = ",", dec = ".")
kv_valid1 <- fread(filename_valid_kv1, header = T, sep = ",", dec = ".")

# duration and kv (note: valid_du means that both onsets and offsets are valid - therefore we only consider valid_du)
valid_du_kv1 <- rbind(duration_valid1[, c("SubNr", "TrialNr")], kv_valid1[, c("SubNr", "TrialNr")])
valid_du_kv1$Duplicated <- duplicated(valid_du_kv1)

# valid performances
valid1 <- valid_du_kv1[Duplicated == TRUE]
valid1$Skill <- "non-expression"

# 2.expressive performances
dt_onset2 <- fread(filename_onset2, header = T, sep = ",", dec = ".")
dt_offset2 <- fread(filename_offset2, header = T, sep = ",", dec = ".")
# remove unnecessary rows/columns
dt_onset2$RowNr <- NULL
dt_offset2$RowNr <- NULL
dt_onset2 <- dt_onset2[Condition == "performing"]
dt_offset2 <- dt_offset2[Condition == "performing"]
# valid performances for each parameter
duration_valid2 <- fread(filename_valid_du2, header = T, sep = ",", dec = ".")
kv_valid2 <- fread(filename_valid_kv2, header = T, sep = ",", dec = ".")
duration_valid2$Skill <- "articulation"
kv_valid2$Skill <- "dynamics"

# valid performances
valid2 <- rbind(duration_valid2, kv_valid2)

### randomly select 3 performances for each skill category (stim_n, stim_a, stim_d)
valid <- rbind(valid1[, c("SubNr", "TrialNr", "Skill")], valid2[, c("SubNr", "TrialNr", "Skill")]) # valid performances for all
valid$Sample <- sample(c(1:nrow(valid)), replace = FALSE)
fwrite(valid, paste(foldername, "valid.txt", sep = ""))

# random selection
stim_n <- min(valid[Skill == "non-expression"]$Sample)
stim_a <- min(valid[Skill == "articulation"]$Sample)
stim_d <- min(valid[Skill == "dynamics"]$Sample)
writeLines(paste("stim_n: ", stim_n, "stim_a: ", stim_a, "stim_d: ", stim_d), paste(foldername, "demo.txt", sep = ""))

# remove first silence and adjust tempo for 100 bpm
dt_demo <- data.table()
counter = 0
for (i in c(stim_n, stim_a, stim_d)){
  subnr = valid[Sample == i]$SubNr
  trialnr = valid[Sample == i]$TrialNr
  if (counter == 0) {
    current_onset <- dt_onset1[SubNr == subnr & TrialNr == trialnr]
    current_offset <- dt_offset1[SubNr == subnr & TrialNr == trialnr]
    counter = counter + 1
  } else if (counter == 1){
    current_onset <- dt_onset2[SubNr == subnr & TrialNr == trialnr & Skill == "articulation"]
    current_offset <- dt_offset2[SubNr == subnr & TrialNr == trialnr & Skill == "articulation"]
    counter = counter + 1
  } else if (counter == 2){
    current_onset <- dt_onset2[SubNr == subnr & TrialNr == trialnr & Skill == "dynamics"]
    current_offset <- dt_offset2[SubNr == subnr & TrialNr == trialnr & Skill == "dynamics"]
  }
  current <- rbind(current_onset, current_offset)
  dt_demo <- rbind(dt_demo, current)
}

# export each performance data 
for (subnr in unique(dt_demo$SubNr)){
  current <- dt_demo[SubNr == subnr]
  current$TimeStamp <- current$TimeStamp-current$TimeStamp[1]
  current <- current[order(TimeStamp),]
  # if (unique(current$Tempo) != 100){ # NEED TO BE FIXED!
  #   current$TimeStamp <- round((current$TimeStamp)/unique(current$Tempo)*100, 0)
  # }
  if (length(unique(current$Skill)) > 1){
    print("It seems the same participant was used more than twice. Run the script again.")
  } else if (unique(current$Skill == "non-expression")){
    fwrite(current, paste(foldername, "1", "_instance.txt", sep = ""))
  } else if (unique(current$Skill == "articulation")){
    fwrite(current, paste(foldername, "2", "_instance.txt", sep = ""))
  } else if (unique(current$Skill == "dynamics")){
    fwrite(current, paste(foldername, "3", "_instance.txt", sep = ""))
  }
}

