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
def next():
    resp = None
    while resp == None:
        allKeys = event.getKeys(keyList = ["space", "escape"])
        for resp in allKeys:
            if resp == "space": # proceed
                break
            elif resp == "escape": # force quit
                core.quit()
    return

def trial(imagefile):
    # stimuli presentation
    ## 1. sheet music  
    stimuli = visual.ImageStim(win, image = imagefile, size = [1500, 535])
    stimuli.draw()

    ## 2. midi play
    playing = True
    while playing:
        win.flip()
        core.wait(3)
        playing = False
    """     midfile = "../../material/stimuli/mid/art_1.mid"
        mid = mido.MidiFile(midfile)
        for msg in mid.play():
            port.send(msg) """

    # get response (rating scale)
    ratingScale = visual.RatingScale(win, low = 1, high = 5, markerStart = 3, leftKeys = "1", rightKeys = "2", acceptKeys = "space", acceptPreText="move left (1) / right (2)")
    resp = None
    while resp == None:
        ratingScale.draw()
        win.flip()
        allKeys = event.getKeys(keyList = ["space", "escape"])
        for resp in allKeys:
            if resp == "space":
                rating = ratingScale.getRating()
                decisionTime = ratingScale.getRT()
                print(rating)
                print(decisionTime)
                core.wait(3)
            elif resp == "escape": # escape
                core.quit()

    event.clearEvents()
    return
#################

# open Max port
# open max file
os.system("open " + "./midiplayer.maxpat")
port = mido.open_output("to Max 1")

# participant"s info (only works with light mode - Mac)
expInfo = {"Number": "", "Today": data.getDateStr()}
dlg = gui.DlgFromDict(expInfo, fixed = ["Today"], title="Rating Pilot")
if dlg.OK == False:
    core.quit() # cancel

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
win = visual.Window([1920, 1200], monitor = "testMonitor", fullscr = True, color = (-.7,-.7,-.7), units = "pix")
fixation = visual.GratingStim(win, color = -1, colorSpace = "rgb", tex=None, mask="circle", size=0.2)

# add clocks
globalClock = core.Clock()
trialClock = core.Clock()

### Instrution ###
# display instructions and wait
## instruction 1
inst1 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400,
    text="Thank you very much for taking part in the pilot study!\n\n In this experiment, you are going to listen to a number of piano performances and asked to rate to what extent musical expressions are implemented.")
inst1.draw()
win.flip()
next() # proceed/force quit

## instruction 2

## instruction 3

### Practice ###
practiceImage = "./image/stim_m.png"
trial(practiceImage)

### Experiment ###

### Thank you ###
thanks = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400,
    text="Thank you!")
thanks.draw()
win.flip()
core.wait(3)

win.close()
core.quit()