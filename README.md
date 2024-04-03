# Experts’ adaptation depending on novices’ skills
<p align="center">
  <img height="300" src="music_adaptation.jpg">
</p>

This repo contains scripts and materials for the music adaptation study with expert pianists.

Open Science Framework: [https://osf.io/becf6/](https://osf.io/becf6/)

# experiment
- Environment: Mac OS X 10.15.7, Max MSP 8.1.11

## prerequisite
- Install the Shell package (https://github.com/jeremybernstein/shell/releases) into the package folder of Max 8.

- The Shell package is used to generate necessary folders to store collected data. If it does not work in your environment, please create the following 2 folders manually.
    + data (path: ~/experiment/data)
    + midi (path: ~/experiment/midi)

# analysis

## 1. preprosessor
data: `raw_data` (test performance), `predata`(baseline performance)
- `filtering.R`: to clean data and remove performance errors >> output: filtered folder
- `trimming.R`: to calculate dependent variables and remove outliers >> output: trimmed folder
- `function.R`: to detect pitch errors in a performance / insert NAs
- `ideal.txt`: the ideal sequence of the piece (used for filtering)
  
## 2. stats
- `baseline.Rmd`: analysis and plots when comparing between baseline and test performance >> output: html file
- `onlyfirst.Rmd`: analysis which only include the performance with the first instance of each student (category) >> output: html file

## demographics
data: `questionnaire.csv`
- `questionnaire.Rmd` >> output: html file

# data
Filtered and trimmed data files for analysis (see details: [perception-v1.0: Workflow](https://github.com/atsukotominaga/music-teaching/tree/main/experiment-1/analysis/preprocessor))

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