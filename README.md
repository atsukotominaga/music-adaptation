# Can expert pianists adapt their didactic demonstration to novices’ skill levels?
<p align="center">
  <img height="300" src="https://media.giphy.com/media/abGjeRq4sQO6A/giphy.gif">
</p>

This repo contains scripts and materials for the experiment investigating whether expert pianists can adapt their performance depending on the level of novices' skills.

Open Science Framework: TBC

# experiment
- Environment: Mac OS X 10.15.7, Max MSP 8.1.11

## prerequisite
- Install the Shell package (https://github.com/jeremybernstein/shell/releases) into the package folder of Max 8.

- The Shell package is used to generate necessary folders to store collected data. If it does not work in your environment, please create the following 2 folders manually.
    + data (path: ~/experiment/data)
    + midi (path: ~/experiment/midi)

# analysis
TBC

# material
## instruction
- `instruction.md`: instruction sheet for an experimenter >> output: html file, pdf file
- `image`: figures used in the instruction sheet and the experiment
- `psd files`: images used for instructions >> output: png files

## sheetmusic
Sheet music for 4 types of expressions
1. without expression (stim_n)
2. with articulation (stim_a)
3. with dynamics (stim_d)
4. with articulation and dynamics (stim_m)

## expstimuli
See details in [Memo](https://github.com/atsukotominaga/adaptation-v1.0/tree/master/material/expstimuli)

## prerating
- Environment: Mac OS X 10.15.6, Max MSP 8
- [Python Environment](https://gist.github.com/atsukotominaga/3414c38eb5add5110d39c4f74723743c)

### psychopy3
- `rating.py`: for the experiment
- `midiplayer.maxpat`: to make midi sound from `rating.py`

### others
- `image`: experimental stimuli (sheet music)
- `mid`: experimental stimuli (performance data)
- `practice`: stimuli for practice trials

## etc
- `cropped`: cropped sheet music