#!/usr/local/bin/python
####################
# Created: 20/04/2020
# This script converts a txt file to midi data and playbacks on Max MSP.

# %% import packages
import csv, time, mido
import pandas as pd
import numpy as np

#%% open port (play sounds with Max MSP)
port = mido.open_output('to Max 1')

# %% read files in a directory
files = [f for f in os.listdir("./stim_n/20_21/1589957466-200520") if not f.startswith("dt_") and not f.startswith("valid")]

#　%% playback and save mid.file

for file in files:
    with open("./stim_d/1589959883-200520/"+file) as csvfile:
        current = csv.reader(csvfile, delimiter = ",")
        next(current) # skip first row
        mid = mido.MidiFile()
        track = mido.MidiTrack()
        mid.tracks.append(track)
        track.append(mido.Message('program_change', program=12, time=0))

        counter = 0
        for row in current:
            if counter == 0:
                previousTime = 0
                counter += 1
            else:
                previousTime = currentTime
            currentTime = int(row[3])*0.001
            currentPitch = int(row[5])
            currentVelocity = int(row[4])
            currentOnOff = int(row[2])
            # assign midi values
            if currentOnOff == 1:
                print(currentOnOff)
                msg = mido.Message('note_on', note = currentPitch, velocity = currentVelocity, time = currentTime)
                track.append(msg)
                print(msg)
                time.sleep(currentTime-previousTime)
                print(msg.time)
                port.send(msg)
            elif currentOnOff == 0:
                msg = mido.Message('note_off', note = currentPitch, velocity = currentVelocity, time = currentTime)
                track.append(msg)
                print(msg)
                time.sleep(currentTime-previousTime)
                print(msg.time)
                port.send(msg)
# %% save mid file
mid.save('new_song.mid')


# %%
