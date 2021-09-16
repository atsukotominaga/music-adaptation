# /usr/local/bin/r
# Combine selected performances and create experimental stimuli
# Created: 03/02/2021

# set working directory
if (!require("here")) {install.packages("here"); require("here")}
here::i_am("combine.R")

# packages
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}

# read base tempo
data_ls <- list.files("./IOI/tempo/", pattern = "txt")
combined <- lapply(data_ls, function(f){
  fread(paste("./IOI/tempo/", f, sep = ""), sep = ",")
})
all_data_onset <- do.call(rbind.data.frame, combined)
all_data_onset$KeyOnOff <- 1 # define onsets

# assign stimuli number
all_data_onset$Stimuli <- 0
counter = 1
for (i in unique(all_data_onset$Instance)){
  all_data_onset[Instance == i]$Stimuli <- counter
  counter = counter + 1
}
all_data_onset[, c("Mean","SD", "N")] <- NULL # remove irrelevant columns

# read info about selected performances
selected <- fread("../../prerating/data/selected_1612309984-030221.txt")

# create TimeStamp
all_data_onset$TimeStamp <- 0
for (i in 1:nrow(all_data_onset)){
  if (all_data_onset$RowNr[i] == 1){
    all_data_onset$TimeStamp[i] <- 0
  } else {
    all_data_onset$TimeStamp[i] <- round(all_data_onset$TimeStamp[i-1]+all_data_onset$IOI[i])
  }
}

# create Pitch
dt_ideal <- fread("./ideal.txt")
all_data_onset$Pitch <- rep(dt_ideal$V1, 4)

# 1. High performances
high_art <- fread("../original/averaging/art/1596379937-020820/dt_du_instance.txt")
high_dyn <- fread("../original/averaging/dyn/1596379899-020820/dt_kv_instance.txt")

# offsets
du_high <- data.table()
for (i in unique(selected[Category == "High"]$midFile)){
  current <- high_art[Instance == i]
  du_high <- rbind(du_high, current)
}

all_data_offset_high <- all_data_onset[, c("Instance" ,"Stimuli", "RowNr")]
all_data_offset_high$KeyOnOff <- 0
all_data_offset_high$Instance <- du_high$Instance
all_data_offset_high$TimeStamp <- round(all_data_onset$TimeStamp+du_high$Mean*300)
all_data_offset_high$Pitch <- rep(dt_ideal$V1, 4)
all_data_offset_high$Velocity <- 0

# onset velocity
kv_high <- data.table()
for (i in unique(selected[Category == "High"]$midFile)){
  current <- high_dyn[Instance == i]
  kv_high <- rbind(kv_high, current)
}

all_data_onset_high <- all_data_onset
all_data_onset_high$Velocity <- round(kv_high$Mean)

all_data_high <- rbind(all_data_onset_high[, !c("IOI")], all_data_offset_high)
all_data_high$Category <- "High"
all_data_high <- all_data_high[order(Stimuli, TimeStamp)]

# 2. Low performances
low_art <- fread("../original/averaging/low/1596207520-310720/dt_du_instance.txt")
low_dyn <- fread("../original/averaging/low/1596207520-310720/dt_kv_instance.txt")

# offsets
du_low <- data.table()
for (i in unique(selected[Category == "Low"]$midFile)){
  current <- low_art[Instance == i]
  du_low <- rbind(du_low, current)
}

all_data_offset_low <- all_data_onset[, c("Instance" ,"Stimuli", "RowNr")]
all_data_offset_low$KeyOnOff <- 0
all_data_offset_low$Instance <- du_low$Instance
all_data_offset_low$TimeStamp <- round(all_data_onset$TimeStamp+du_low$Mean*300)
all_data_offset_low$Pitch <- rep(dt_ideal$V1, 4)
all_data_offset_low$Velocity <- 0

# onset velocity
kv_low <- data.table()
for (i in unique(selected[Category == "Low"]$midFile)){
  current <- low_dyn[Instance == i]
  kv_low <- rbind(kv_low, current)
}

all_data_onset_low <- all_data_onset
all_data_onset_low$Velocity <- round(kv_low$Mean)

all_data_low <- rbind(all_data_onset_low[, !c("IOI")], all_data_offset_low)
all_data_low$Category <- "Low"
all_data_low <- all_data_low[order(Stimuli, TimeStamp)]

# 3. Art_only performances
# offsets
du_art <- data.table()
for (i in unique(selected[Category == "Art_only"]$midFile)){
  current <- high_art[Instance == i]
  du_art <- rbind(du_art, current)
}

all_data_offset_art <- all_data_onset[, c("Instance" ,"Stimuli", "RowNr")]
all_data_offset_art$KeyOnOff <- 0
all_data_offset_art$Instance <- du_art$Instance
all_data_offset_art$TimeStamp <- round(all_data_onset$TimeStamp+du_art$Mean*300)
all_data_offset_art$Pitch <- rep(dt_ideal$V1, 4)
all_data_offset_art$Velocity <- 0

# onset velocity
kv_art <- data.table()
for (i in unique(selected[Category == "Art_only"]$midFile)){
  current <- low_dyn[Instance == i]
  kv_art <- rbind(kv_art, current)
}

all_data_onset_art <- all_data_onset
all_data_onset_art$Velocity <- round(kv_art$Mean)

all_data_art <- rbind(all_data_onset_art[, !c("IOI")], all_data_offset_art)
all_data_art$Category <- "Art_only"
all_data_art <- all_data_art[order(Stimuli, TimeStamp)]

# 4. Dyn_only performances
# offsets
du_dyn <- data.table()
for (i in unique(selected[Category == "Dyn_only"]$midFile)){
  current <- low_art[Instance == i]
  du_dyn <- rbind(du_dyn, current)
}

all_data_offset_dyn <- all_data_onset[, c("Instance" ,"Stimuli", "RowNr")]
all_data_offset_dyn$KeyOnOff <- 0
all_data_offset_dyn$Instance <- du_dyn$Instance
all_data_offset_dyn$TimeStamp <- round(all_data_onset$TimeStamp+du_dyn$Mean*300)
all_data_offset_dyn$Pitch <- rep(dt_ideal$V1, 4)
all_data_offset_dyn$Velocity <- 0

# onset velocity
kv_dyn <- data.table()
for (i in unique(selected[Category == "Dyn_only"]$midFile)){
  current <- high_dyn[Instance == i]
  kv_dyn <- rbind(kv_dyn, current)
}

all_data_onset_dyn <- all_data_onset
all_data_onset_dyn$Velocity <- round(kv_dyn$Mean)

all_data_dyn <- rbind(all_data_onset_dyn[, !c("IOI")], all_data_offset_dyn)
all_data_dyn$Category <- "Dyn_only"
all_data_dyn <- all_data_dyn[order(Stimuli, TimeStamp)]

# combine all
all_data <- rbind(all_data_high, all_data_art, all_data_dyn, all_data_low)

# export data separately for each performance
# create txt for each instance
dir.create("./stimuli")

for (category in unique(all_data$Category)){
  for (i in 1:4){
    current <- all_data[Category == category & Stimuli == i]
    filename = paste("./stimuli/", tolower(category), "_", i, ".txt", sep = "")
    fwrite(current, filename)
  }
}
