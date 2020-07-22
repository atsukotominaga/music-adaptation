# Memo
We aim to generate artificial novices' performances by using existing data of our previous study (GitHub repo: [teaching-v2.0](https://github.com/atsukotominaga/teaching-v2.0)).

## Previous experiment

In the previous study, we created one piece based on Clementi, Sonatina in C major, op. 36 no. 3. In the experiment, participants were asked to play the piece with either articulation or dynamics.

1. Articulation
![](stim_a/stim_a.png)

2. Dynamics
![](stim_d/stim_d.png)

## Basic idea
### Tempo (from IOIs)

### Articulation (from durations)

### Dynamics (from velocity profiles)

## Generatin stimuli (recordings)
Filtered data from [teaching-v2.0](https://osf.io/uemk5/) were used to generate stimuli.

For articulation, we used both onsets and offsets of keystrokes to determine durations of each note.
For dynamics, we used only onsets to determine velocity profiles of each note.

### Ideal performance
![](stim_h/stim_m.png)

### stim_h (high)
Both articulation and dynamics are implemented correctly.

### stim_a (intermediate-articulation)
Only articulation is implemented correctly (dynamics missing).

### stim_d (intermediate-dynamics)
Only dynamics is implemented correctly (articulation missing).

### stim_l (low)
None of them is implemented (both articulation and dynamics missing).