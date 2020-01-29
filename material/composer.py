#!/usr/local/bin/python
####################
# Created: 20/01/2019
# This script generates experimental stimuli for adaptation-v1.0

# %% import packages
import csv, time, mido
import pandas as pd
import numpy as np

#%% open port (play sounds with Max MSP)
port = mido.open_output('to Max 1')

# %% read csv
df = pd.read_csv('./17_dyn_original.txt', delimiter = " ", header = None)

# change column names
df.columns = ["NoteNr", "TimeStamp", "Pitch", "Velocity", "Key_OnOff", "Device", "Tempo", "SubNr", "BlockNr", "TrialNr", "Skill", "Condition", "Image"]

# %% remove irrelevant characters
df["NoteNr"] = df["NoteNr"].map(lambda x: x.rstrip(","))
df["Image"] = df["Image"].map(lambda x: x.rstrip(";"))

# %% convert str to int
df["NoteNr"] = pd.to_numeric(df["NoteNr"])

# %%  use only relevant notes (remove metronomes)
df_original = df
df =  df[df['NoteNr'] >= 17]

# %%　for each note (velocity)
""" ls_forte = [range(1,6,1), range(9,18,1), range(21,27,1), range(40,48,1)]
ls_piano = [range(6,9,1), range(29,33,1), range(36,40,1), range(48,52,1), range(58,66,1)]
 """
# %% create Subcomponent column with NA
# df["Subcomponent"] = "NA"

# divide the dataframe to Note On/Off
df_on = df[df["Key_OnOff"] == 1]
df_off = df[df["Key_OnOff"] == 0]
# assign SubNoteNr for each dataframe
df_on["SubNoteNr"] = range(1, len(df_on)+1)
df_off["SubNoteNr"] = range(1, len(df_off)+1)

# %% assign subcomponents
""" for phrase in ls_forte:
    for note in phrase:
        df_on["Subcomponent"][df_on["SubNoteNr"] == note] = "Forte"
        df_off["Subcomponent"][df_off["SubNoteNr"] == note] = "Forte"

for phrase in ls_piano:
    for note in phrase:
        df_on["Subcomponent"][df_on["SubNoteNr"] == note] = "Piano"
        df_off["Subcomponent"][df_off["SubNoteNr"] == note] = "Piano" """

# %% generate normal distribution
mu = np.mean([81.4913, 83.2003, 62.4241, 60.5309])
sigma = np.mean([8.1196, 8.8414, 4.8157, 3.7596])
norm = np.random.normal(mu, sigma, 1000)

# extract values within 1SD
condition1 = norm < mu+sigma
condition2 = norm > mu-sigma

norm_new = list(set(np.concatenate([np.extract(condition1, norm), np.extract(condition2, norm)])))

# %% manipulate Velocity values
for i in range(len(df_on["Velocity"])):
    df_on["Velocity"].iloc[i] = int(np.random.choice(norm_new, 1)[0])

# %% remove .0
df_on["Velocity"] = df_on["Velocity"].astype(int)

# %% combine two dataframe again
df = pd.concat([df_on, df_off])
df = df.sort_values("NoteNr")

# %% add characters so that Max can recognise the file
df["NoteNr"] = df["NoteNr"].apply(lambda x: f"{x},")
df["SubNoteNr"] = df["SubNoteNr"].apply(lambda x: f"{x};")

# %% save
df.to_csv('./17_dynamics.txt', sep = " ", index = False, header = False)

#　%% play the new version
with open('./17_dynamics.txt') as csvfile:
    current = csv.reader(csvfile, delimiter = " ")
    counter = 0
    for row in current:
        if counter == 0:
            previousTime = 6
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

# %%
