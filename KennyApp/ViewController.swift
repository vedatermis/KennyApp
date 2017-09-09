//
//  ViewController.swift
//  KennyApp
//
//  Created by Vedat ERMIS on 16.08.2017.
//  Copyright © 2017 Vedat ERMIS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hiScoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    @IBOutlet weak var kenny10: UIImageView!
    @IBOutlet weak var kenny11: UIImageView!
    @IBOutlet weak var kenny12: UIImageView!
    @IBOutlet weak var kenny13: UIImageView!
    @IBOutlet weak var kenny14: UIImageView!
    @IBOutlet weak var kenny15: UIImageView!
    @IBOutlet weak var kenny16: UIImageView!
    
    var counter = Timer()
    var hiddenTimer = Timer()
    var counterTime = 30
    var score = 0
    var kennyArray = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let highScore = UserDefaults.standard.object(forKey: "highscore")
        
        if highScore == nil {
            hiScoreLabel.text = "0"
        }
        
        if let newScore = highScore as? Int {
            hiScoreLabel.text = String(newScore)
        }
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer13 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer14 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer15 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer16 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        
        kenny1.isUserInteractionEnabled = true;
        kenny2.isUserInteractionEnabled = true;
        kenny3.isUserInteractionEnabled = true;
        kenny4.isUserInteractionEnabled = true;
        kenny5.isUserInteractionEnabled = true;
        kenny6.isUserInteractionEnabled = true;
        kenny7.isUserInteractionEnabled = true;
        kenny8.isUserInteractionEnabled = true;
        kenny9.isUserInteractionEnabled = true;
        kenny10.isUserInteractionEnabled = true;
        kenny11.isUserInteractionEnabled = true;
        kenny12.isUserInteractionEnabled = true;
        kenny13.isUserInteractionEnabled = true;
        kenny14.isUserInteractionEnabled = true;
        kenny15.isUserInteractionEnabled = true;
        kenny16.isUserInteractionEnabled = true;
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny6.addGestureRecognizer(recognizer7)
        kenny7.addGestureRecognizer(recognizer8)
        kenny8.addGestureRecognizer(recognizer9)
        kenny10.addGestureRecognizer(recognizer10)
        kenny11.addGestureRecognizer(recognizer11)
        kenny12.addGestureRecognizer(recognizer12)
        kenny13.addGestureRecognizer(recognizer13)
        kenny14.addGestureRecognizer(recognizer14)
        kenny15.addGestureRecognizer(recognizer15)
        kenny16.addGestureRecognizer(recognizer16)
        
        kennyArray.append(kenny1)
        kennyArray.append(kenny2)
        kennyArray.append(kenny3)
        kennyArray.append(kenny4)
        kennyArray.append(kenny5)
        kennyArray.append(kenny6)
        kennyArray.append(kenny7)
        kennyArray.append(kenny8)
        kennyArray.append(kenny9)
        kennyArray.append(kenny10)
        kennyArray.append(kenny11)
        kennyArray.append(kenny12)
        kennyArray.append(kenny13)
        kennyArray.append(kenny14)
        kennyArray.append(kenny15)
        kennyArray.append(kenny16)
        
        hideKenny()
        
        
        counter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        
        hiddenTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
    }

    @objc func increaseScore() {
        score = score + 1
        scoreLabel.text = "Score : \(score)"
    }
    
    @objc func countDown() {
        counterLabel.text = String(counterTime)
        counterTime = counterTime - 1;
        
        if (counterTime < 0) {
            counter.invalidate()
            hiddenTimer.invalidate()
            
            if self.score > Int(hiScoreLabel.text!)! {
                
                UserDefaults.standard.set(self.score, forKey: "highscore")
                hiScoreLabel.text = String(self.score)
            }

            let alert = UIAlertController(title: "Kenny'i Yakala", message: "Süreniz Doldu", preferredStyle: UIAlertControllerStyle.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score : \(self.score)"
                self.counterTime = 30
                self.counterLabel.text = "\(self.counterTime)"
                
                self.counter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
                
                self.hiddenTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
                
                
            })
            
            alert.addAction(replayButton)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func hideKenny() {
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
        
    }
    
    


}

