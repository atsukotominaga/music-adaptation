#!/usr/bin/env python

"""
This script is based on tutorials on Psychopy3 website.
https://www.psychopy.org/coder/tutorial2.html
"""

# import libraries
from psychopy import core, visual, gui, data, event
from psychopy import sound
from psychopy.tools.filetools import fromFile, toFile
import os, numpy, random, mido

# open Max port
# open max file
os.system('open ' + "./midiplayer.maxpat")
port = mido.open_output('to Max 1')

# participant's info (only light mode)
expInfo = {'Number': '', 'Today': data.getDateStr()}
dlg = gui.DlgFromDict(expInfo, fixed = ['Today'], title="Rating Pilot")
if dlg.OK == False:
    core.quit()

"""
   ('-.  ) (`-.       _ (`-.    ('-.  _  .-')          _   .-')       ('-.       .-') _  .-') _    
 _(  OO)  ( OO ).    ( (OO  ) _(  OO)( \( -O )        ( '.( OO )_   _(  OO)     ( OO ) )(  OO) )   
(,------.(_/.  \_)-._.`     \(,------.,------.  ,-.-') ,--.   ,--.)(,------.,--./ ,--,' /     '._  
 |  .---' \  `.'  /(__...--'' |  .---'|   /`. ' |  |OO)|   `.'   |  |  .---'|   \ |  |\ |'--...__) 
 |  |      \     /\ |  /  | | |  |    |  /  | | |  |  \|         |  |  |    |    \|  | )'--.  .--' 
(|  '--.    \   \ | |  |_.' |(|  '--. |  |_.' | |  |(_/|  |'.'|  | (|  '--. |  .     |/    |  |    
 |  .--'   .'    \_)|  .___.' |  .--' |  .  '.',|  |_.'|  |   |  |  |  .--' |  |\    |     |  |    
 |  `---. /  .'.  \ |  |      |  `---.|  |\  \(_|  |   |  |   |  |  |  `---.|  | \   |     |  |    
 `------''--'   '--'`--'      `------'`--' '--' `--'   `--'   `--'  `------'`--'  `--'     `--'    

"""
# make a text file to save data
filename = expInfo['Number'] + expInfo['Today']
dataFile = open(filename + '.txt', 'w')
dataFile.write('stimType, likertScale, RT\n')

# create window and stimuli
win = visual.Window([1920, 1200], fullscr = True, monitor = 'testMonitor', units = 'pix')
fixation = visual.GratingStim(win, color = -1, colorSpace = 'rgb', tex=None, mask='circle', size=0.2)

# add clocks
globalClock = core.Clock()
trialClock = core.Clock()

# display instructions and wait
mes1 = visual.TextStim(win, pos=[0, 0], font = 'Helvetica', height = 42, wrapWidth = 1400,
    text='Thank you very much for taking part in the pilot study!\n\n In this experiment, you are going to listen to a number of piano performances and asked to rate to what extent musical expressions are implemented.')
mes1.draw()
fixation.draw()
win.flip()

# pause until there's a keypress
event.waitKeys(keyList = ['space'])

# stimuli presentation - TBC

# get response (rating scale)
ratingScale = visual.RatingScale(win, low = 1, high = 5, markerStart = 3, leftKeys = '1', rightKeys = '2', acceptKeys = 'space', acceptPreText='move left (1) / right (2)')
counter = 0
while ratingScale.noResponse:
    mid = mido.MidiFile('../../material/stimuli/mid/art_1.mid')
    if counter == 0:
        for msg in mid.play():
            port.send(msg)
            counter += 1
    ratingScale.draw()
    win.flip()
rating = ratingScale.getRating()
decisionTime = ratingScale.getRT()

event.waitKeys(keyList = ['space'])