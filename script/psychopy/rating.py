"""
This script is based on tutorials on Psychopy3 website.
"""

# import libraries
from psychopy import core, visual, gui, data, event
from psychopy.tools.filetools import fromFile, toFile
import numpy, random

# dialogue box
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
win = visual.Window([800, 600], fullscr = True, monitor = 'testMonitor', units = 'pix')
fixation = visual.GratingStim(win, color = -1, colorSpace = 'rgb', tex=None, mask='circle', size=0.2)

# add clocks
globalClock = core.Clock()
trialClock = core.Clock()

# display instructions and wait
mes1 = visual.TextStim(win, pos=[0, +3], font = 'Helvetica', height = 42, wrapWidth = 1400,
    text='Thank you very much for taking part in the pilot study!\n\n In this experiment, you are going to listen to a number of piano performances and asked to rate to what extent musical expressions are implemented.')
mes1.draw()
fixation.draw()
win.flip()

# pause until there's a keypress
event.waitKeys(keyList = ['space'])