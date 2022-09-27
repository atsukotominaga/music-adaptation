# install and load required packages
if (!require("data.table")) {install.packages("data.table"); require("data.table")}
if (!require("tibble")) {install.packages("tibble"); require("tibble")}
if (!require("editData")) {install.packages("editData"); require("editData")}
if (!require("ggplot2")) {install.packages("ggplot2"); require("ggplot2")}

# ggplot settings
theme_set(theme_classic())

### check whether a trial contains pitch errors
# data: data of the current trial
# ideal: dt_ideal
checker <- function(data, ideal){
  dt_errors <- data.table() # return data of erroneous trials - SubNr/TrialNr/Reason
  for (subject in unique(data$SubNr)){
    for (trial in unique(data[SubNr == subject]$TrialNr)){
      current <- data[SubNr == subject & TrialNr == trial]
      if (nrow(current) != 0){ # current data not empty
        if (nrow(current) != nrow(ideal)){ # extra/missing note
          if (nrow(current) > nrow(ideal)){
            dt_errors <- rbind(dt_errors, data.table(subject, trial, "Extra Notes")) 
          } else if (nrow(current) < nrow(ideal)){
            dt_errors <- rbind(dt_errors, data.table(subject, trial, "Missing Notes")) 
          }
        } else if (nrow(current) == nrow(ideal)){ # substituted note
          for (note in 1:nrow(ideal)){
            if (current$Pitch[note] != ideal$Pitch[note]){
              dt_errors <- rbind(dt_errors, data.table(subject, trial, paste("Substituted Notes - RowNr ", as.character(note), sep = "")))
              break
            }
          }
        }
      } else if (nrow(current) == 0){ # current data empty
        dt_errors <- rbind(dt_errors, data.table(subject, trial, paste("Missing Trial")))
      }
    }
  }
  if (nrow(dt_errors) != 0){
    colnames(dt_errors) <- c("SubNr", "TrialNr", "Reason")
    return(dt_errors)
  } else if (nrow(dt_errors) == 0){
    return("No errors!")
  }
}

### edit data
# data: data of the current trial
# ideal: dt_ideal
edit <- function(data, ideal){
  data$RowNr <- c(1:nrow(data))
  length_diff <- abs(nrow(data) - nrow(ideal))
  data$Ideal <- c(ideal$Pitch, rep(NA, length_diff))
  data$Diff <- "NA"
  data[Pitch != Ideal]$Diff <- "DIFFERENT"
  # sort the order of columns
  setcolorder(data, c("RowNr", "NoteNr", "TimeStamp", "Pitch", "Ideal", "Diff", "Velocity", "Key_OnOff", "Device", "SubNr", "TrialNr", "Stimuli", "Session", "Error"))
  corrected <- editData(data)
  return(data.table(corrected)) # convert to data.table
}

### insert NA
# data: data of the current trial
# ideal: dt_ideal
insert_na <- function(data, ideal){
  # insert NA row
  while (nrow(data) < nrow(ideal)){
    for (note in 1:nrow(data)){
      if (note != 71){
        if (data$Pitch[note] != ideal$Pitch[note]){
          data <- add_row(data, .before = note)
          data[note] <- data[note-1]
          data$TimeStamp[note] <- NA
          data$Velocity[note] <- NA
          data$Pitch[note] <- ideal$Pitch[note]
          break
        }
      } else if (note == 71){
        if (data$Pitch[note] != ideal$Pitch[note]){
          data <- add_row(data, .after = note)
          data[note+1] <- data[note]
          # NA71
          data$TimeStamp[note] <- NA
          data$Velocity[note] <- NA
          data$Pitch[note] <- ideal$Pitch[note]
          # NA72
          data$TimeStamp[note+1] <- NA
          data$Velocity[note+1] <- NA
          data$Pitch[note+1] <- ideal$Pitch[note+1]
          break
        } else if (data$Pitch[note] == ideal$Pitch[note]){ # if the very last note is missing
          data <- add_row(data, .after = note)
          data[note+1] <- data[note]
          data$TimeStamp[note+1] <- NA
          data$Velocity[note+1] <- NA
          data$Pitch[note+1] <- ideal$Pitch[note+1]
          break
        }
      }
    }
  }
  return(data)
}

# make and print a graph
graph <- function(data){
  graph <- ggplot() +
    geom_line(data = data, aes(x = RowNr, y = Pitch), colour = "#F8766D") +
    geom_line(data = data, aes(x = RowNr, y = Ideal), colour = "#00BFC4") +
    geom_point(data = data, aes(x = RowNr, y = Pitch), colour = "#F8766D") +
    geom_point(data = data, aes(x = RowNr, y = Ideal), colour = "#00BFC4") +
    scale_x_continuous("RowNr", current_1$RowNr) +
    coord_fixed(ratio = 1/4) +
    labs(title = sprintf("SubNr: %s, TrialNr: %s", unique(data$SubNr), unique(data$TrialNr)), y = "Pitch")
  print(graph)
}
  
