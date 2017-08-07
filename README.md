# Smart Recording Speech with Swift 3

A very simple demo app, in Swift 3, with a button to turn on recording. User starts talking and speech will be recorded until silence is detected. The output is saved into a WAV file. This is very useful to capture full sentences instead of length fixed audio chunks.

I had issues getting WAV headers well formed. No much docummentation about that online. I finally was able to overcome this by learning about WAV specs http://soundfile.sapp.org/doc/WaveFormat/. The key trick was to use the function `convertAudio`. This function takes an url input of a m4a file, and converts it into a wav file.

If you have any questions please let me now at: johanjmoncada [at] gmail.com

The base code to create this demo was taken from https://github.com/fulldecent/FDSoundActivatedRecorder/ Thanks to William Entriken for that.
