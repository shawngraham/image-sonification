## Readme

[![DOI](https://zenodo.org/badge/357629564.svg)](https://zenodo.org/badge/latestdoi/357629564)

Supporting scripts for Graham, S., and Simons, J. 'Listening to Dura Europos: An Experiment in Archaeological Image Sonification'

To run the sonifyImage.py script, download the JythonMusic environment from https://jythonmusic.me/download/. Change line 44 to the filename of the image you wish to sonify. Run the script. The resulting .mid file can be opened with Garageband or similar music editing program for instrumentation and transformation into an mp3 file.

The R script takes a table of observations on the qualities of the music and the perceived intensity of the music. Using the tidytext package, it turns the qualitative description of the qualities of the music into a sentiment score using the AFINN lexicon. These scores are turned into a scatterplot of sentiment versus intensity, to give (ironically) a visual overview of the sound of multiple images at once.
