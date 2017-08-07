# Swift Speech Recording

This project was created to show you how to create a speech recording in Swift 3 and stopping captured when silent is detected. The result of recording will be a wav file with header and data correctly formated.

When it is created a wav file with swift 3 this add a extra header which sometimes create a lot of problems due to extra header not is allow by wav file specifications, in this demo I found a solution for this problem with the function `convertAudio`.

The function `convertAudio` take a url input of a m4a file and save in the output url the wav file with headers and data like is showed in this specifications: http://soundfile.sapp.org/doc/WaveFormat/

If you have any questions please let me now at: johan@sancrisoft.com
