##### FUNCTIONS #####

# install and load required packages
if (!require("data.table")) {install.packages("data.table"); require("data.table")}

### define pitch remove function (pitch_remover)
# data: data of all trials (df_onset/df_offset)
# ideal: df_ideal
pitch_remover <- function(data, ideal){
  ls_removed <- list()
  for (subnr in unique(data$SubNr)){ #set # of participants
    print(sprintf("---SubNr %i---", subnr))
    for (trial in unique(unique(data[SubNr == subnr]$TrialNr))){
      current <- data %>% dplyr::filter(SubNr == subnr &  TrialNr == trial)
      if (nrow(current) != 0){ #if current data is not empty
        if (length(ideal$Pitch) != length(current$Pitch)){ #if # of onsets/offsets is not equal to ideal performance
          ls_removed <- c(ls_removed, list(c(subnr, trial, "NoteNr error")))
          print(sprintf("NoteNr error - SubNr/TrialNr: %i/%i", subnr, trial))
        } else if (length(ideal$Pitch) == length(current$Pitch)) { #if # of onsets and offsets are correct
          counter = 0 #set a counter so that the following loop will terminate once it detects one pitch error in a trial
          for (note in 1:length(ideal$Pitch)){
            # detect onset error
            if (current$Pitch[note] != ideal$Pitch[note]){
              while (counter == 0){
                ls_removed <- c(ls_removed, list(c(subnr, trial, "Pitch error")))
                print(sprintf("Pitch error - SubNr/TrialNr/NoteNr: %i//%i/%i", subnr, trial, note))
                counter = counter + 1
              }
            }
          }
        }
      } else { #if current data is emtpy"
        ls_removed <- c(ls_removed, list(c(subnr, trial, "Missing")))
        print(sprintf("Missing - SubNr/TrialNr: %i/%i", subnr, trial))
      }
    }
  }
  return(ls_removed)
}
