from psychopy import visual, core

# create a window

mywin = visual.Window([800,600], monitor="testMonitor", units="deg")

# create some stimuli
grating = visual.GratingStim(win=mywin, mask="circle", size=3, pos=[-4,0], sf=3)
fixation = visual.GratingStim(win=mywin, size=0.5, pos=[0,0], sf=0, rgb=-1)

# draw the stimuli and update the window
for frameN in range(200):
    grating.setPhase(0.05, '+')
    grating.draw()
    fixation.draw()
    mywin.update()

# pause for 5 secs
core.wait(5.0)