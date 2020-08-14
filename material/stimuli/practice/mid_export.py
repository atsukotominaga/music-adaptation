#!/usr/local/bin/python
####################
# Created: 12/08/2020
# This script converts txt files to mid files.
# For demo, I used raw performance data (not averages ones), so indexing for currentTime is different from original mid_export.py for stimuli

#%% import packages
import os, csv, time, mido
import pandas as pd
import numpy as np

#%% create mid folder if not existed
if not os.path.exists("mid"):
    os.mkdir("mid")

#%% folder names
folders = ["./1597392664-140820/"]

#%% mid export
for folder in folders:
    for instance in range(1, 4):
        filename = folder + str(instance) + "_instance.txt"
        with open(filename) as csvfile:
            # create mid file
            mid = mido.MidiFile()
            track = mido.MidiTrack()
            mid.tracks.append(track)
            track.append(mido.Message('program_change', program=0, time=0)) # program 0 = Acoustic Grand Piano
            # name for mid file
            midname = "./mid/demo_" + str(instance) + ".mid"
            # read current track data (txt file)   
            current = csv.reader(csvfile, delimiter = ",")
            next(current) # skip first row

            counter = 0
            for row in current:
                if counter == 0:
                    previousTime = 0
                    counter += 1
                else:
                    previousTime = currentTime
                # tempo always 100bpm
                if int(row[6]) == 120:
                    currentTime = int(mido.second2tick(int(row[1])*0.001+3, 480, round(500000*(500/600), 0))) # adjust tempo
                elif int(row[6]) == 110:
                    currentTime = int(mido.second2tick(int(row[1])*0.001+3, 480, round(500000*(545/600), 0))) # adjust tempo
                elif int(row[6]) == 100:
                    currentTime = int(mido.second2tick(int(row[1])*0.001+3, 480, round(500000*(600/600), 0)))
                currentPitch = int(row[2])
                currentVelocity = int(row[3])
                currentOnOff = int(row[4])
                # assign midi values
                if currentOnOff == 1:
                    track.append(mido.Message('note_on', note=currentPitch, velocity=currentVelocity, time=currentTime-previousTime))
                elif currentOnOff == 0:
                    track.append(mido.Message('note_off', note=currentPitch, velocity=currentVelocity, time=currentTime-previousTime))
            mid.save(midname) # save track

print("Done :D")
# %%
