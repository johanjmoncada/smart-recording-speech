# Swift Speech Recording

Turn on listening and start to talk, this demo keep listening and recording in wav file chunks of your voice split everytime that you stop your speech and it start to record again with your speech

This project was created to show you how to create a speech recording in Swift 3 and stopping capture when silent is detected. The result of recording will be a wav file with header and data correctly formated.

Everytime When it is created a wav file with swift 3 this add a extra header which sometimes create a lot of problems due to extra header not is allow by wav file specifications, in this demo I found a solution for this problem with the function `convertAudio`.

The function `convertAudio` take a url input of a m4a file and save in the output url the wav file with headers and data like is showed in this specifications: http://soundfile.sapp.org/doc/WaveFormat/

If you have any questions please let me now at: johan@sancrisoft.com

The code base to build this demo was take from https://github.com/fulldecent/FDSoundActivatedRecorder thank to William Entriken
