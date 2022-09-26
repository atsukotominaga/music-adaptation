## ----setup, include = FALSE---------------------------------
# packages
# data manipulation
if (!require("data.table")) {install.packages("data.table"); require("data.table")}
# plot
if (!require("ggpubr")) {install.packages("ggpubr"); require("ggpubr")}


## ----file, include = FALSE----------------------------------
filename_q = "./questionnaire.csv"


## ----extract, echo = FALSE----------------------------------
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

dt$PianoTotalYears <- c()

# change some characteristics
dt$Age <- as.numeric(dt$Age)
dt$PianoTotalPractice <- as.numeric(dt$PianoTotalPractice)

# exclude participants
dt_included <- dt

print(dt_included)


## ----1, echo = FALSE----------------------------------------
data.table("Answer" = dt_included$`Did you try to perform differently when you are asked to play as a teacher during the experiment? If so, please describe how you changed your performance?`)


## ----2, echo = FALSE----------------------------------------
data.table("Answer" = dt_included$`Have you noticed anything special regarding the tasks in the experiment? If any, please describe below.`)


## ----export, include = FALSE--------------------------------
knitr::purl("questionnaire.Rmd")

