#!/usr/bin/env python

"""
This script is based on tutorials on Psychopy3 website.
https://www.psychopy.org/coder/tutorial2.html
"""

# import libraries
from psychopy import core, visual, gui, data, event
from psychopy.tools.filetools import fromFile, toFile
import os, numpy, random, mido

### functions ###

#################

# open Max port
# open max file
os.system("open " + "./midiplayer.maxpat")
port = mido.open_output("to Max 1")

# participant"s info (only works with light mode - Mac)
expInfo = {"Number": "", "Today": data.getDateStr()}
dlg = gui.DlgFromDict(expInfo, fixed = ["Today"], title="Rating Pilot")
if dlg.OK == False:
    core.quit()

"""
   ("-.  ) (`-.       _ (`-.    ("-.  _  .-")          _   .-")       ("-.       .-") _  .-") _    
 _(  OO)  ( OO ).    ( (OO  ) _(  OO)( \( -O )        ( ".( OO )_   _(  OO)     ( OO ) )(  OO) )   
(,------.(_/.  \_)-._.`     \(,------.,------.  ,-.-") ,--.   ,--.)(,------.,--./ ,--," /     "._  
 |  .---" \  `."  /(__...--"" |  .---"|   /`. " |  |OO)|   `."   |  |  .---"|   \ |  |\ |"--...__) 
 |  |      \     /\ |  /  | | |  |    |  /  | | |  |  \|         |  |  |    |    \|  | )"--.  .--" 
(|  "--.    \   \ | |  |_." |(|  "--. |  |_." | |  |(_/|  |"."|  | (|  "--. |  .     |/    |  |    
 |  .--"   ."    \_)|  .___." |  .--" |  .  ".",|  |_."|  |   |  |  |  .--" |  |\    |     |  |    
 |  `---. /  .".  \ |  |      |  `---.|  |\  \(_|  |   |  |   |  |  |  `---.|  | \   |     |  |    
 `------""--"   "--"`--"      `------"`--" "--" `--"   `--"   `--"  `------"`--"  `--"     `--"    

"""
# make a text file to save data
if not os.path.exists("data"): # make a folder if not exists
    os.makedirs("data")
filename = expInfo["Number"] + expInfo["Today"]
dataFile = open("./data/" + filename + ".txt", "w")
dataFile.write("stim, likertScale, RT\n")

# create window and stimuli
win = visual.Window([1920, 1200], monitor = "testMonitor", fullscr = True, color = (1,1,1), units = "pix")
fixation = visual.GratingStim(win, color = -1, colorSpace = "rgb", tex=None, mask="circle", size=0.2)

# add clocks
globalClock = core.Clock()
trialClock = core.Clock()

# display instructions and wait
mes1 = visual.TextStim(win, pos=[0, 0], font = "Arial", height = 60, wrapWidth = 1400,
    text="Thank you very much for taking part in the pilot study!\n\n In this experiment, you are going to listen to a number of piano performances and asked to rate to what extent musical expressions are implemented.")
mes1.draw()
win.flip()

# pause until there's a keypress
resp = None
while resp == None:
    allKeys = event.getKeys(keyList = ["space", "escape"])
    for resp in allKeys:
        if resp == "escape":
            core.quit()
        elif resp == "space":
            break

# stimuli presentation
## 1. sheet music
imagefile = "./image/stim_m.png"
stimuli = visual.ImageStim(win, image = imagefile, size = [1500, 535])
stimuli.draw()

## 2. midi play
playing = True
while playing:
    win.flip()
    midfile = "../../material/stimuli/mid/art_1.mid"
    mid = mido.MidiFile(midfile)
    for msg in mid.play():
        port.send(msg)
    playing = False

# get response (rating scale)
ratingScale = visual.RatingScale(win, low = 1, high = 5, markerStart = 3, leftKeys = "1", rightKeys = "2", acceptKeys = "space", acceptPreText="move left (1) / right (2)")
resp = None
while resp == None:
    ratingScale.draw()
    win.flip()
    allKeys = event.getKeys(keyList = ["space", "escape"])
    for thisKey in ["space", "escape"]:
        if thisKey == "space":
            rating = ratingScale.getRating()
            decisionTime = ratingScale.getRT()
            print(rating)
            print(decisionTime)
            core.wait(3)

        elif thisKey == "escape": # escape
            core.quit()

event.clearEvents()

win.close()
core.quit()