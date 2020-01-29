#!/usr/local/bin/python
####################
# Created: 29/01/2019
# This script generates experimental stimuli for adaptation-v1.0 (articulation)

# %% import packages
import csv, time, mido
import pandas as pd
import numpy as np

#%% open port (play sounds with Max MSP)
port = mido.open_output('to Max 1')

# %% read csv
df = pd.read_csv('./17_art_original.txt', delimiter = " ", header = None)

# change column names
df.columns = ["NoteNr", "TimeStamp", "Pitch", "Velocity", "Key_OnOff", "Device", "Tempo", "SubNr", "BlockNr", "TrialNr", "Skill", "Condition", "Image"]

# %% remove irrelevant characters
df["NoteNr"] = df["NoteNr"].map(lambda x: x.rstrip(","))
df["Image"] = df["Image"].map(lambda x: x.rstrip(";"))

# %% convert str to int
df["NoteNr"] = pd.to_numeric(df["NoteNr"])

# %%  use only relevant notes (remove metronomes)
df_original = df
df = df[df['NoteNr'] >= 17]

# divide the dataframe to Note On/Off
df_on = df[df["Key_OnOff"] == 1]
df_off = df[df["Key_OnOff"] == 0]

# %% generate normal distribution
mu = np.mean([30.6598, 31.7097, -196.3454, -204.8299])
sigma = np.mean([17.9120, 18.3470, 22.8536, 28.5505	])
norm = np.random.normal(mu, sigma, 1000)

# extract values within 1SD
condition1 = norm < mu+sigma
condition2 = norm > mu-sigma

norm_new = list(set(np.concatenate([np.extract(condition1, norm), np.extract(condition2, norm)])))

# %% manipulate Velocity values
for i in range(len(df_on["TimeStamp"])):
    if i < len(df_on["TimeStamp"])-1:
        df_off["TimeStamp"].iloc[i] = int(np.random.choice(norm_new, 1)[0]) + df_on["TimeStamp"].iloc[i+1]


# %% remove .0
df_on["TimeStamp"] = df_on["TimeStamp"].astype(int)
df_off["TimeStamp"] = df_off["TimeStamp"].astype(int)

# %% combine two dataframe again
df = pd.concat([df_on, df_off])
df = df.sort_values("TimeStamp")

# %% add characters so that Max can recognise the file
df["NoteNr"] = df["NoteNr"].apply(lambda x: f"{x},")
df["Image"] = df["Image"].apply(lambda x: f"{x};")

# %% save
df.to_csv('./17_articulation.txt', sep = " ", index = False, header = False)
#　%% play the new version
with open('./17_articulation.txt') as csvfile:
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
