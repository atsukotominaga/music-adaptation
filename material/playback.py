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

#　%% playback
with open("./stim_n/6_instance.txt") as csvfile:
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
\
