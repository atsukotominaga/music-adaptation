#%% import packages
import csv, time, mido
import pandas as pd
import numpy as np

#%% open port (play sounds with Max MSP)
port = mido.open_output('to Max 1')

#%% play the original version
with open('./txt/example_f.txt') as csvfile:
    current = csv.reader(csvfile, delimiter = " ")
    counter = 0
    for row in current:
        if counter == 0:
            previousTime = 0
            counter += 1
        else:
            previousTime = currentTime
        currentTime = int(row[1])*0.001
        currentPitch = int(row[2])
        currentVelocity = int(row[3])
        currentOnOff = int(row[4])
        if currentOnOff == 1:
            print(currentOnOff)
        # assign midi values
        if currentOnOff == 1:
            msg = mido.Message('note_on', note = currentPitch, velocity = currentVelocity, time = currentTime)
            print(msg)
            time.sleep(currentTime-previousTime)
            print(msg.time)
            port.send(msg)
        elif currentOnOff == 0:
            msg = mido.Message('note_off', note = currentPitch, velocity = currentVelocity, time = currentTime)
            print(msg)
            time.sleep(currentTime-previousTime)
            print(msg.time)
            port.send(msg)

# %% tweak velocity (weak forte)
df_f = pd.read_csv('./txt/example_f.txt', delimiter = " ", header = None)

# change column names
df_f.columns = ["NoteNr", "TimeStamp", "Pitch", "Velocity", "Key_OnOff", "Device", "Tempo", "SubNr", "BlockNr", "TrialNr", "Skill", "Condition", "Image"]

# %% remove irrelevant characters
df_f["NoteNr"] = df_f["NoteNr"].map(lambda x: x.rstrip(","))
df_f["Image"] = df_f["Image"].map(lambda x: x.rstrip(";"))

# %% convert str to int
df_f["NoteNr"] = pd.to_numeric(df_f["NoteNr"])

# %%  use only relevant notes (remove metronomes)
df_f_weak =  df_f[df_f['NoteNr'] >= 17]

# %%　for each note (velocity)
ls_forte = [range(1,6,1), range(9,18,1), range(21,27,1), range(40,48,1)]
ls_piano = [range(6,9,1), range(29,33,1), range(36,40,1), range(48,52,1), range(58,66,1)]

# %% define
# new column Subcomponent
# %%assign subcomponents
for phrase in ls_forte:
    for note in phrase:
        df_f_weak[df_f_weak["NoteNr"] == note+16, "Subcomponent"] = "Forte"



# %%
