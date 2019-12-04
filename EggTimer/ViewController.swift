//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPLayer: AVAudioPlayer!
    var time: Int?
    var timer = Timer()
    var counter = 0
    var isRunning = false
    let dictionary = [
        "Soft": 5,
        "Medium": 10,
        "Hard": 15
    ]
    
    var url = Bundle.main.url(forResource: "alarm", withExtension: ".wav")
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func eggButton(_ sender: UIButton) {
        time = dictionary[sender.currentTitle!]!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(cooking), userInfo: nil, repeats: true)
    }
    
    
    @objc func cooking(){
        if counter < time! {
            counter += 1
            progressView.progress = Float(counter) / Float(time!)
            progressView.tintColor = UIColor.red
        }else {
            audioPLayer = try! AVAudioPlayer(contentsOf: self.url!)
            audioPLayer.play()
            timer.invalidate()
            time = 0
            counter = 0
            progressView.progress = 0.0
        
        }
        
        
    }
    
}
