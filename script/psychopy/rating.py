#!/usr/bin/env python

"""
This is a pilot experiment for stimuli selection.
Code reference: https://www.psychopy.org/coder/tutorial2.html
"""

# import libraries
from psychopy import core, visual, gui, data, event
from psychopy.tools.filetools import fromFile, toFile
import os, random, mido

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

def trial(imageFile, midFile, ratingOrder, resultsList):
    # stimuli presentation
    ## 1. sheet music  
    stimuli = visual.ImageStim(win, image = imageFile, size = [1500, 535])
    stimuli.draw()

    ## 2. midi play
    playing = True
    while playing:
        win.flip() # sheet music
        mid = mido.MidiFile(midFile)
        core.wait(3) # delete afterwards
        playing = False

    if ratingOrder == "articulation":
        itemText1 = "To what extend was [ Articulation ] implemented?\n\nPress <Return> to confirm\n\n"
        itemText2 = "To what extend was [ Dynamics ] implemented?\n\nPress <Return> to confirm\n\n"
    elif ratingOrder == "dynamics":
        itemText1 = "To what extend was [ Dynamics ] implemented?\n\nPress <Return> to confirm\n\n"
        itemText2 = "To what extend was [ Articulation ] implemented?\n\nPress <Return> to confirm\n\n"

    # get response (rating scale)
    ratingScale1 = visual.RatingScale(win, scale = "not at all                             fully", low = 1, high = 5, markerStart = 3, marker = "circle", markerColor = "Orange", textFont = "Avenir", size = 1.5, noMouse = True, acceptKeys = "return", showAccept = False, skipKeys = None)
    item1 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400,
    text = itemText1)
    trialClock1 = core.Clock()
    while ratingScale1.noResponse: # noResponse will be False once participant accepts the answer
        item1.draw()
        ratingScale1.draw()
        win.flip()
        
    # store responses
    resultsList.append([
        ratingScale1.getRating(), # final answer
        trialClock1.getTime(), # RT1
        ratingScale1.getRT(), # RT2
        ratingScale1.getHistory(), # history
        ratingOrder, # which rate first
        expInfo["Number"], # subject number
        expInfo["Today"], # date
        globalClock
    ])
    print(resultsList)
    event.clearEvents()

    # get response2 (rating scale)
    ratingScale2 = visual.RatingScale(win, scale = "not at all                              fully", low = 1, high = 5, markerStart = 3, marker = "circle", markerColor = "Orange", textFont = "Avenir", size = 1.5, noMouse = True, acceptKeys = "return", showAccept = False, skipKeys = None)
    item2 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400,
    text = itemText2)
    trialClock2 = core.Clock()
    while ratingScale2.noResponse: # noResponse will be False once participant accepts the answer
        item2.draw()
        ratingScale2.draw()
        win.flip()
        
    # store responses
    resultsList.append([
        ratingScale2.getRating(), # final answer
        trialClock2.getTime(), # RT1
        ratingScale2.getRT(), # RT2
        ratingScale2.getHistory(), # history
        ratingOrder, # wchich rate first
        expInfo["Number"], # subject number
        expInfo["Today"], # date
        globalClock
    ])
    print(resultsList)

    inst = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400, alignText = "left",
    text = "Press <Space> to continue")
    inst.draw()
    win.flip()
    next() # proceed/force quit
    event.clearEvents()

    return
    
#################

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

# open Max port
os.system("open " + "./midiplayer.maxpat") # open max file
port = mido.open_output("to Max 1")

# participant"s info (only works with light mode - Mac)
expInfo = {"Number": "", "Today": data.getDateStr()}
dlg = gui.DlgFromDict(expInfo, fixed = ["Today"], title="Rating Pilot")
if dlg.OK == False:
    core.quit() # cancel


# make a text file to save data
if not os.path.exists("data"): # make a folder if not exists
    os.makedirs("data")
""" filename = expInfo["Number"] + expInfo["Today"]
dataFile = open("./data/" + filename + ".txt", "w")
dataFile.write("stim, likertScale, RT\n") """

# list to store answers
resultsList = []

# create window and stimuli
win = visual.Window([1920, 1200], monitor = "testMonitor", fullscr = True, color = (-.7,-.7,-.7), units = "pix")
win.mouseVisible = False # hide mouse

# add global clock
globalClock = core.Clock()

### Instrution ###
# display instructions and wait
## instruction 1
inst1 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400, alignText = "left",
    text = "Thank you very much for participating in the pilot study!\n\nIn this experiment, you are going to listen to a number of piano performances and will be asked to rate to what extent musical expressions are implemented in each performance.\n\nPress <Space> to continue")
inst1.draw()
win.flip()
next() # proceed/force quit

## instruction 2
imageFile = visual.ImageStim(win, image = "./image/stim_m.png", pos = [0, -50], size = [1500, 535])
inst2 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400,
    text = "You will listen to one piece with two notated musical techniques.\n\n\n\n\n\n\n\n\nPress <Space> to continue")
imageFile.draw()
inst2.draw()
win.flip()
next() # proceed/force quit

## instruction 3
imageFile = visual.ImageStim(win, image = "./image/stim_m.png", pos = [0, -50], size = [1500, 535])
inst3 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400,
    text = "[ Articulation ]\nthe smoothness of sound (legato and staccato)\n\n\n\n\n\n\n\n\nPress <Space> to continue")
imageFile.draw()
inst3.draw()
win.flip()
next() # proceed/force quit

## instruction 4
imageFile = visual.ImageStim(win, image = "./image/stim_m.png", pos = [0, -50], size = [1500, 535])
inst4 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400,
    text = "[ Dynamics ]\nthe loudness of sound (forte and piano)\n\n\n\n\n\n\n\n\nPress <Space> to continue")
imageFile.draw()
inst4.draw()
win.flip()
next() # proceed/force quit

## instruction 5
inst5 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400, alignText = "left",
    text = "You will listen to a performance recording first. After that, you will be required to rate to what extent musical techniques are implemented in terms of both articulation (legato and staccato) and dynamics (forte and piano).\n\nRating is separate for each technique.\n\nPress <Space> to continue")
inst5.draw()
win.flip()
next() # proceed/force quit

## instruction 6
inst6 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400, alignText = "left",
    text = "Any questions?\n\nThere will be 3 practice trials where you can see how to rate each performance. Also adjust the volume so that you can comfortably listen to the recording.\n\nPress <Space> to start practice trials")
inst6.draw()
win.flip()
next() # proceed/force quit

### Practice ###
pFileList = os.listdir("practice")
random.shuffle(pFileList) # stimuli randomisation
# trial(imageFile, pMid, pText, answers)

imageFile = "./image/stim_m.png"
practice = True
while practice:
    for file in pFileList:
        midFile = "./practice/" + file
        ratingOrder = random.choice(["articulation", "dynamics"])
        trial(imageFile, midFile, ratingOrder, resultsList)
        
    ## instruction 7
    inst7 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400, alignText = "left",
        text = "Any questions?\n\nIf you want to repeat the practice trials again,\nPress <Return> key.\n\nIf you are ready for experimental trials,\nPress <Space> to start")
    inst7.draw()
    win.flip()
    resp = None
    while resp == None:
        allKeys = event.getKeys(keyList = ["space", "escape", "return"])
        for resp in allKeys:
            if resp == "space": # proceed
                practice = False
            elif resp == "escape": # force quit
                core.quit()
            elif resp == "returm": # practice again
                practice = True

### Experiment ###
inst8 = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 60, wrapWidth = 1400, alignText = "left",
    text = "In total, there are 64 performance recordings.\n\nThe order of rating will be randomised (rating articulation first or dynamics first).\n\nAny questions? If not,\n\nPress <Space> to start experimental trials")
inst8.draw()
win.flip()
next() # proceed/force quit

eFileList = os.listdir("mid")
random.shuffle(eFileList) # stimuli randomisation
eOrder = ["articulation", "dynamics"] * 32
random.shuffle(eOrder) # randomisation for rating questions

for trial in eOrder:
    print(str(trial) + "trial")

# write results
""" for item in answers:
        dataFile.write('{0}, {1}, {2}, {3}, {4}, {5}\n'.format(*item))
        dataFile.close() """

### Thank you ###
thanks = visual.TextStim(win, pos=[0, 0], font = "Avenir", height = 100, wrapWidth = 1400,
    text="Thank you!")
thanks.draw()
win.flip()
core.wait(3)

### Close ###
win.close()
core.quit()