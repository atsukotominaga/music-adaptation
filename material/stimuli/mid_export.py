#!/usr/local/bin/python
####################
# Created: 20/04/2020
# This script converts a txt file to midi data and playbacks on Max MSP.

#%% import packages
import os, csv, time, mido
import pandas as pd
import numpy as np

#%% open port (play sounds with Max MSP)
port = mido.open_output('to Max 1')
if not os.path.exists("mid"):
    os.mkdir("mid")

#%% folder names
folder_low = "./low/1596207520-310720/"
folder_art = "./art/1596379937-020820/"
folder_dyn = "./dyn/1596379899-020820/"
folder_high = "./high/1596380946-020820/"
folders = [folder_low, folder_art, folder_dyn, folder_high]

#%% playback
for folder in folders:
    for instance in range(1, 17):
        filename = folder + str(instance) + "_instance.txt"
        with open(filename) as csvfile:
            mid = mido.MidiFile()
            track = mido.MidiTrack()
            mid.tracks.append(track)
            if folder == "./low/1596207520-310720/":
                midname = "./mid/low_" + str(instance) + ".mid"
            elif folder == "./art/1596379937-020820/":
                midname = "./mid/art_" + str(instance) + ".mid"
            elif folder == "./dyn/1596379899-020820/":
                midname = "./mid/dyn_" + str(instance) + ".mid"
            elif folder == "./high/1596380946-020820/":
                midname = "./mid/high_" + str(instance) + ".mid"

            track.append(mido.Message('program_change', program=12, time=0))

            current = csv.reader(csvfile, delimiter = ",")
            next(current) # skip first row
            counter = 0
            for row in current:
                if counter == 0:
                    previousTime = 0
                    counter += 1
                else:
                    previousTime = currentTime
                currentTime = int(mido.second2tick(int(row[3])*0.001+3, 480, 500000))
                print(currentTime-previousTime)
                currentPitch = int(row[5])
                currentVelocity = int(row[4])
                currentOnOff = int(row[2])
                # assign midi values
                if currentOnOff == 1:
                    #print(currentOnOff)
                    track.append(mido.Message('note_on', note=currentPitch, velocity=currentVelocity, time=currentTime-previousTime))
                elif currentOnOff == 0:
                    #print(currentOnOff)
                    track.append(mido.Message('note_off', note=currentPitch, velocity=currentVelocity, time=currentTime-previousTime))
            mid.save(midname)
# %%
