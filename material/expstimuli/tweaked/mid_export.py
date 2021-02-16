#!/usr/local/bin/python
####################
# This script converts txt files to mid files.

#%% import packages
import os, csv, mido

#%% create mid folder if not existed
if not os.path.exists("mid"):
    os.mkdir("mid")

#%% list exported instances
files = [f for f in os.listdir("./") if f.endswith('.txt')]

#%% mid export
for file in files:
    with open(file) as csvfile:
        # create mid file
        mid = mido.MidiFile()
        track = mido.MidiTrack()
        mid.tracks.append(track)
        track.append(mido.Message('program_change', program=0, time=0)) # program 0 = Acoustic Grand Piano
        # name for mid file
        midname = "./mid/" + file.replace(".txt",".mid")
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
            currentTime = int(mido.second2tick(int(row[9])*0.001, 480, 500000))
            currentPitch = int(row[2])
            currentVelocity = int(row[3])
            currentOnOff = int(row[10])
            # assign midi values
            if currentOnOff == 1:
                track.append(mido.Message('note_on', note=currentPitch, velocity=currentVelocity, time=currentTime-previousTime))
            elif currentOnOff == 0:
                track.append(mido.Message('note_off', note=currentPitch, velocity=currentVelocity, time=currentTime-previousTime))
        mid.save(midname) # save track

print("Done :D")
# %%
