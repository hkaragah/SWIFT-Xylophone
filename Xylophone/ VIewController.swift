//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    var soundURL: NSURL?
    var soundID: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        
        playSound(with: sender.tag)
        
    }
    
    func playSound(with noteNumber: Int) {
        
        let soundURL = Bundle.main.url(forResource: "note\(noteNumber)", withExtension: "wav")
        //soundURL = NSURL(fileURLWithPath: soundURL!)
        if let url = soundURL {
            AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
            AudioServicesPlaySystemSound(soundID)
        }
        
    }
}

//Alternative code block
//import AVFoundation
//class ViewController: UIViewController, AVAudioPlayerDelegate {
//    var audioPlayer: AVAudioPlayer!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    @IBAction func notePressed(_ sender: UIButton) {
//        playSound(with: sender.tag)
//    }
//    func playSound(with noteNumber: Int)  {
//        let soundURL = Bundle.main.url(forResource: "note\(noteNumber)", withExtension: "wav")
//
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
//        } catch {
//            print(error)
//        }
//
//        audioPlayer.play()
//    }
//}

