//
//  ViewController.swift
//  MonTimer
//
//  Created by Rodolphe DUPUY on 25/08/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer: Timer = Timer() // Timer
    
    var timeSpent: Int = 0
    var isActive = false // Boolean si le Timer est déjà en train de tourner

    override func viewDidLoad() {
        super.viewDidLoad()
        enableButtons()
    }
    
    @IBAction func playPressed(_ sender: Any) {
        if !isActive { // Timer est déjà en train de tourner ?
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                //Code toutes les 1 secondes
                self.timeSpent += 1
                self.updateLabel()
                self.enableButtons()
            })
            isActive = true
        }
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        pause()
    }

    @IBAction func stopPressed(_ sender: Any) {
        timeSpent = 0
        updateLabel()
        pause()
    }

    func enableButtons() {
        playButton.isEnabled = !isActive
        pauseButton.isEnabled = isActive
        stopButton.isEnabled = (isActive || (timeSpent != 0))
    }
    
    func updateLabel() {
        timeLabel.text = "\(timeSpent)"
    }

    func pause() {
        timer.invalidate()
        isActive = false
        enableButtons()
    }
    
}
