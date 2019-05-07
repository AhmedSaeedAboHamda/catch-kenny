//
//  ViewController.swift
//  catch the kenny
//
//  Created by AhmedSaeed on 1/20/19.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var heighScoreLabel: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    var timer = Timer()
    var animationTimer = Timer()
    var decreaseTime = 1
    var imageArray = [UIImageView]()
    var score = 0
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imageArray.append(image1)
        imageArray.append(image2)
        imageArray.append(image3)
        imageArray.append(image4)
        imageArray.append(image5)
        imageArray.append(image6)
        imageArray.append(image7)
        imageArray.append(image8)
        imageArray.append(image9)
        
        timerLabel.text = "5"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.changeTime), userInfo: self, repeats: true)
        animationTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.animation), userInfo: self, repeats: true)
    
//for height score saved
        let returnValue = UserDefaults.standard.object(forKey: "r")
        let heightScoreNumber = returnValue as? Int
        if (returnValue) == nil
        {
            heighScoreLabel.text = "0"
        }
        if returnValue != nil
        {
            heighScoreLabel.text = String(heightScoreNumber!)
        }
        
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.addScore))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.addScore))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.addScore))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.addScore))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.addScore))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.addScore))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.addScore))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.addScore))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.addScore))
        
        image1.isUserInteractionEnabled = true
        image2.isUserInteractionEnabled = true
        image3.isUserInteractionEnabled = true
        image4.isUserInteractionEnabled = true
        image5.isUserInteractionEnabled = true
        image6.isUserInteractionEnabled = true
        image7.isUserInteractionEnabled = true
        image8.isUserInteractionEnabled = true
        image9.isUserInteractionEnabled = true
        
        image1.addGestureRecognizer(gestureRecognizer1)
        image2.addGestureRecognizer(gestureRecognizer2)
        image3.addGestureRecognizer(gestureRecognizer3)
        image4.addGestureRecognizer(gestureRecognizer4)
        image5.addGestureRecognizer(gestureRecognizer5)
        image6.addGestureRecognizer(gestureRecognizer6)
        image7.addGestureRecognizer(gestureRecognizer7)
        image8.addGestureRecognizer(gestureRecognizer8)
        image9.addGestureRecognizer(gestureRecognizer9)
        
        animation()
        
    }
    
// animation
    @objc func animation()
    {
        for index in imageArray
        {
            index.isHidden = true
        }
        let x = Int(arc4random_uniform(UInt32(imageArray.count)-1))
        imageArray[x].isHidden = false
    }
// increas score
    @objc func addScore()
    {
        score += 1
        scoreLabel.text  = String(score)
    }
// function for change time
    @objc func changeTime()
    {
        if Int(timerLabel.text!)! != 0
        {
            timerLabel.text  = String(Int(timerLabel.text!)! - 1)
        }
        else
        {
            timer.invalidate()
            animationTimer.invalidate()
            
            let alert = UIAlertController(title: "..kenny..", message: " Time Has Finished ", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
            let replay = UIAlertAction(title: "replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = String(self.score)
                self.timerLabel.text = "30"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.changeTime), userInfo: self, repeats: true)
                self.animationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.animation), userInfo: self, repeats: true)
                
            }
            alert.addAction(ok)
            alert.addAction(replay)
            self.present(alert, animated: true, completion: nil)
            

            if self.score > Int(heighScoreLabel.text!)!
            {
                UserDefaults.standard.set(self.score, forKey: "r")
                heighScoreLabel.text = String(self.score)
            }
        }
    }
    
    

}

