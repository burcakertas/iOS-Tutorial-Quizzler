//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreValue: UILabel!
    
    
    var quizBrain = QuizBrain()
    var totalOfQuestions = 0
    
//    viewDidLoad code block is triggers ONLY ONCE when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //true, false
        
        let check = quizBrain.checkAnswer(userAnswer)
        if check{
            sender.backgroundColor = .green
        }
        else{
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        //if we did not use this timer code, we could not see the color changing at all beacuse it happens to fast.
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil , repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        //make the button color clear so that when the next question comes up, the color does not stay
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.returnProgressBar()
    }
    
}

