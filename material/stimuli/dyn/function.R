# averaging function (create 16 instances - averaging 3 performances)
# packages
if (!require("data.table")) {install.packages("data.table"); require("data.table")}

# valid: information(data.table) about valid performances
# number: loop number (if outside loop, enter 0)

combining_onset <- function(dt_onset, valid, number){
  SubNr1 <- valid[Sample == number+counter]$SubNr
  SubNr2 <- valid[Sample == number+1+counter]$SubNr
  SubNr3 <- valid[Sample == number+2+counter]$SubNr
  TrialNr1 <- valid[Sample == number+counter]$TrialNr
  TrialNr2 <- valid[Sample == number+1+counter]$TrialNr
  TrialNr3 <- valid[Sample == number+2+counter]$TrialNr
  stim_1 <- dt_onset[SubNr == SubNr1 & TrialNr == TrialNr1]
  stim_2 <- dt_onset[SubNr == SubNr2 & TrialNr == TrialNr2]
  stim_3 <- dt_onset[SubNr == SubNr3 & TrialNr == TrialNr3]
  outcome <- rbind(stim_1, stim_2, stim_3)
  outcome$RowNr <- rep(c(1:72), 3)
  
  # tempo labels
  outcome[Tempo == 120]$Tempo <- 250
  outcome[Tempo == 110]$Tempo <- 273
  outcome[Tempo == 100]$Tempo <- 300
  return(outcome)
}

combining_offset <- function(dt_offset, valid, number){
  SubNr1 <- valid[Sample == number+counter]$SubNr
  SubNr2 <- valid[Sample == number+1+counter]$SubNr
  SubNr3 <- valid[Sample == number+2+counter]$SubNr
  TrialNr1 <- valid[Sample == number+counter]$TrialNr
  TrialNr2 <- valid[Sample == number+1+counter]$TrialNr
  TrialNr3 <- valid[Sample == number+2+counter]$TrialNr
  stim_1 <- dt_offset[SubNr == SubNr1 & TrialNr == TrialNr1]
  stim_2 <- dt_offset[SubNr == SubNr2 & TrialNr == TrialNr2]
  stim_3 <- dt_offset[SubNr == SubNr3 & TrialNr == TrialNr3]
  outcome <- rbind(stim_1, stim_2, stim_3)
  outcome$RowNr <- rep(c(1:72), 3)
  
  # tempo labels
  outcome[Tempo == 120]$Tempo <- 250
  outcome[Tempo == 110]$Tempo <- 273
  outcome[Tempo == 100]$Tempo <- 300
  return(outcome)
}

