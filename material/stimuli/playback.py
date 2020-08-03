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

# %% folder names
folder_low = "./low/1596207520-310720"
folder_art = "./art/1596379937-020820"
folder_dyn = "./dyn/1596379899-020820"
folder_high = "./high/1596380946-020820"
folders = [folder_low, folder_art, folder_dyn, folder_high]

#　%% playback
with open("./stim_all/1592382209-170620/8_instance.txt") as csvfile:
    current = csv.reader(csvfile, delimiter = ",")
    next(current) # skip first row
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

#　%% playback and save mid.file
with open("./stim_all/1589959883-200520/1_instance.txt") as csvfile:
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
        currentTime = round(int(row[3])*0.001, 3)
        currentPitch = int(row[5])
        currentVelocity = int(row[4])
        currentOnOff = int(row[2])
        # assign midi values
        if currentOnOff == 1:
            print(currentOnOff)
            msg = mido.Message('note_on', note = currentPitch, velocity = currentVelocity, time = int(currentTime))
            track.append(msg)
            print(msg)
            time.sleep(round(currentTime-previousTime, 3))
            port.send(msg)
        elif currentOnOff == 0:
            msg = mido.Message('note_off', note = currentPitch, velocity = currentVelocity, time = int(currentTime))
            track.append(msg)
            print(msg)
            time.sleep(round(currentTime-previousTime, 3))

# %%
