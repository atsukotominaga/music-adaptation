## ----setup, include = FALSE---------------------------------------------------
# packages
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}


## ----file, include = FALSE----------------------------------------------------
filename_q = "./questionnaire.csv"


## ----extract, echo = FALSE----------------------------------------------------
# read csv files
dt <- fread(filename_q, header = T, sep = ",", dec = ".", na.string = "NA")
dt <- dt[-c(1,2),] # exclude test/pilot data

# change some colnames
colnames(dt)[2] <- "SubNr"
colnames(dt)[3] <- "Age"
colnames(dt)[4] <- "Gender"
colnames(dt)[7] <- "Handedness"
colnames(dt)[15] <- "PianoTotalPractice"
colnames(dt)[25] <- "TeachingPiano" # there are only people who have taught the piano
colnames(dt)[27] <- "TeachingPianoYears"

dt$TeachingPianoYears <- c(7, 1, 12, 5, 30, NA, 11, 2, 5, 3, 6, NA, 3, 6, 8, 9, 3, NA, 5, 3)

# change some characteristics
dt$Age <- as.numeric(dt$Age)
dt$PianoTotalPractice <- as.numeric(dt$PianoTotalPractice)

# exclude participants
dt_included <- dt

print(dt_included)


## ----2, echo = FALSE----------------------------------------------------------
data.table("Answer" = dt_included$`Have you noticed anything special regarding the tasks in the experiment? If any, please describe below.`)


## ----export, include = FALSE--------------------------------------------------
knitr::purl("questionnaire.Rmd")

