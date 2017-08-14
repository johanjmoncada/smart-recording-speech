//
//  ViewController.swift
//  smart-recording-speech
//
//  Created by Johan Moncada on 8/6/17.
//  Copyright © 2017 Johan Moncada. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    var recorder: SpeechRecorder = SpeechRecorder()
    var savedURL: URL? = nil
    var player = AVPlayer()
    
    //@IBAction func pressedStartListening() {
    //    recorder.startListening()
    //}
    @IBAction func pressedStartListening(_ sender: UIButton) {
        recorder.startListening()
    }
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var microphoneLevel: UILabel!
    
    override func loadView() {
        super.loadView()
        MyFileManager().clearTempFolder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recorder.delegate = self
        recorder.addObserver(self, forKeyPath: "microphoneLevel", options:.new, context: nil)
        
        let audioSession = AVAudioSession.sharedInstance()
        _ = try? audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        _ = try? audioSession.setActive(true)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch change![NSKeyValueChangeKey.newKey] {
        case let level as Double:
            progressView.progress = Float(level)
            microphoneLevel.text = String(format: "%0.2f", level)
        default:
            break
        }
    }

}

extension ViewController: SpeechRecorderDelegate {
    func soundActivatedRecorderDidStartRecording(recorder: SpeechRecorder) {
        progressView.progressTintColor = UIColor.red
    }
    
    func soundActivatedRecorderDidFinishRecording(recorder: SpeechRecorder, andSaved file: NSURL) {
        progressView.progressTintColor = UIColor.black
    }
    
    /// No recording has started or been completed after listening for `TOTAL_TIMEOUT_SECONDS`
    func soundActivatedRecorderDidTimeOut(recorder: SpeechRecorder) {
        progressView.progressTintColor = UIColor.blue
    }
    
    /// The recording and/or listening ended and no recording was captured
    func soundActivatedRecorderDidAbort(recorder: SpeechRecorder) {
        progressView.progressTintColor = UIColor.blue
    }
}


