# averaging function (create 6 instances)
# packages
if (!require("data.table")) {install.packages("data.table"); require("data.table")}

# valid: information(data.table) about valid performances
# number: loop number (if outside loop, enter 0)

combining_onset <- function(valid, number){
  SubNr1 <- valid[Sample == number+counter]$SubNr
  SubNr2 <- valid[Sample == number+1+counter]$SubNr
  SubNr3 <- valid[Sample == number+2+counter]$SubNr
  SubNr4 <- valid[Sample == number+3+counter]$SubNr
  SubNr5 <- valid[Sample == number+4+counter]$SubNr
  TrialNr1 <- valid[Sample == number+counter]$TrialNr
  TrialNr2 <- valid[Sample == number+1+counter]$TrialNr
  TrialNr3 <- valid[Sample == number+2+counter]$TrialNr
  TrialNr4 <- valid[Sample == number+3+counter]$TrialNr
  TrialNr5 <- valid[Sample == number+4+counter]$TrialNr
  stim_1 <- dt_onset[SubNr == SubNr1 & TrialNr == TrialNr1]
  stim_2 <- dt_onset[SubNr == SubNr2 & TrialNr == TrialNr2]
  stim_3 <- dt_onset[SubNr == SubNr3 & TrialNr == TrialNr3]
  stim_4 <- dt_onset[SubNr == SubNr4 & TrialNr == TrialNr4]
  stim_5 <- dt_onset[SubNr == SubNr5 & TrialNr == TrialNr5]
  outcome <- rbind(stim_1, stim_2, stim_3, stim_4, stim_5)
  outcome$RowNr <- rep(c(1:72), 5)
  
  # tempo labels
  outcome[Tempo == 120]$Tempo <- 250
  outcome[Tempo == 110]$Tempo <- 273
  outcome[Tempo == 100]$Tempo <- 300
  return(outcome)
}

combining_offset <- function(valid, number){
  SubNr1 <- valid[Sample == number+counter]$SubNr
  SubNr2 <- valid[Sample == number+1+counter]$SubNr
  SubNr3 <- valid[Sample == number+2+counter]$SubNr
  SubNr4 <- valid[Sample == number+3+counter]$SubNr
  SubNr5 <- valid[Sample == number+4+counter]$SubNr
  TrialNr1 <- valid[Sample == number+counter]$TrialNr
  TrialNr2 <- valid[Sample == number+1+counter]$TrialNr
  TrialNr3 <- valid[Sample == number+2+counter]$TrialNr
  TrialNr4 <- valid[Sample == number+3+counter]$TrialNr
  TrialNr5 <- valid[Sample == number+4+counter]$TrialNr
  stim_1 <- dt_offset[SubNr == SubNr1 & TrialNr == TrialNr1]
  stim_2 <- dt_offset[SubNr == SubNr2 & TrialNr == TrialNr2]
  stim_3 <- dt_offset[SubNr == SubNr3 & TrialNr == TrialNr3]
  stim_4 <- dt_offset[SubNr == SubNr4 & TrialNr == TrialNr4]
  stim_5 <- dt_offset[SubNr == SubNr5 & TrialNr == TrialNr5]
  outcome <- rbind(stim_1, stim_2, stim_3, stim_4, stim_5)
  outcome$RowNr <- rep(c(1:72), 5)
  
  # tempo labels
  outcome[Tempo == 120]$Tempo <- 250
  outcome[Tempo == 110]$Tempo <- 273
  outcome[Tempo == 100]$Tempo <- 300
  return(outcome)
}

