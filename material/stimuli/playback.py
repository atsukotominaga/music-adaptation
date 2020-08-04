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
        filename = folder + instance + "_instance.txt"
        with open(filename) as csvfile:
            current = csv.reader(csvfile, delimiter = ",")
            next(current) # skip first row
            counter = 0
            for row in current:
                if counter == 0:
                    previousTime = 0
                    counter += 1
                else:
                    previousTime = currentTime
                currentTime = int(row[3])*0.001+3 # 3 sec delay at the beginning
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
                time.sleep(3) # 3 sec pause

#%%
with open("./low/1596207520-310720/1_instance.txt") as csvfile:
    current = csv.reader(csvfile, delimiter = ",")
    next(current) # skip first row
    msg = mido.Message('note_on', note = 64, velocity = 1) # switch ON "record" on Max/MSP
    port.send(msg)
    counter = 0
    for row in current:
        if counter == 0:
            previousTime = 0
            counter += 1
        else:
            previousTime = currentTime
        currentTime = int(row[3])*0.001+3 # 3 sec delay at the beginning
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
    time.sleep(3) # 3 sec pause
    msg = mido.Message('note_on', note = 64, velocity = 1) # switch OFF "record" on Max/MSP
    port.send(msg)



# %%
