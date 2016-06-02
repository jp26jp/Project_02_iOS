//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AVFoundation


class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    let maxQuestions = 4
    var questionsAsked = 0
    var correct = 0
    var questionInfo: Int = 0
    
    let normalButton = UIColor(red: 3/255.0, green: 169/255.0, blue: 244/255.0, alpha: 1.0)
    let correctButton = UIColor(red: 76/255.0, green: 175/255.0, blue: 80/255.0, alpha: 1.0)
    let incorrectButton = UIColor(red: 244/255.0, green: 67/255.0, blue: 54/255.0, alpha: 1.0)
    
    var startGameSound : AVAudioPlayer?
    var correctAnswerSound : AVAudioPlayer?
    var incorrectAnswerSound : AVAudioPlayer?

    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option01: UIButton!
    @IBOutlet weak var option02: UIButton!
    @IBOutlet weak var option03: UIButton!
    @IBOutlet weak var option04: UIButton!
    @IBOutlet weak var resultsField: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!

    func setupAudioPlayerWithFile(file:NSString, type:NSString, folder:NSString) -> AVAudioPlayer?  {
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String, inDirectory: folder as String)
        let url = NSURL.fileURLWithPath(path!)
        var audioPlayer:AVAudioPlayer?
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        return audioPlayer
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startGameSound = self.setupAudioPlayerWithFile("Start", type: "mp3", folder: "Sound") {
            self.startGameSound = startGameSound
        }
        if let correctAnswerSound = self.setupAudioPlayerWithFile("Up", type:"mp3", folder: "Sound") {
            self.correctAnswerSound = correctAnswerSound
        }
        if let incorrectAnswerSound = self.setupAudioPlayerWithFile("Down", type:"mp3", folder: "Sound") {
            self.incorrectAnswerSound = incorrectAnswerSound
        }
        startGameSound?.play()
        displayQuestion()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayQuestion() {
        
        // Set the normal button color
        option01.backgroundColor = normalButton
        option02.backgroundColor = normalButton
        option03.backgroundColor = normalButton
        option04.backgroundColor = normalButton

        // Make sure buttons are enabled
        option01.userInteractionEnabled = true
        option02.userInteractionEnabled = true
        option03.userInteractionEnabled = true
        option04.userInteractionEnabled = true

        if questionsAsked <= maxQuestions {
            
            // Question count
            questionsAsked += 1
        
            // Find random question
            questionInfo = GKRandomSource.sharedRandom().nextIntWithUpperBound(allQuestions.count)
        
            // Assign selected question to variable
            let selectedQuestion = allQuestions[questionInfo]
        
            // Pass selected question to the question field
            questionField.text = selectedQuestion.question
        
            // Pass selected question options to the buttons
            option01.setTitle(selectedQuestion.option01, forState: .Normal)
            option02.setTitle(selectedQuestion.option02, forState: .Normal)
            option03.setTitle(selectedQuestion.option03, forState: .Normal)
            option04.setTitle(selectedQuestion.option04, forState: .Normal)
        
        }
    }

    
    @IBAction func checkAnswer(sender: UIButton) {
        
        // Disable user action after answer has been selected
        option01.userInteractionEnabled = false
        option02.userInteractionEnabled = false
        option03.userInteractionEnabled = false
        option04.userInteractionEnabled = false
        
        // Assign selected question to variable
        let selectedQuestion = allQuestions[questionInfo]

        // Assign selected question's answer to variable
        let correctAnswer = selectedQuestion.answer
        
        
        // Check if answer
        if sender.titleLabel!.text == correctAnswer {
            correct += 1
            correctAnswerSound?.play()
            sender.backgroundColor = correctButton
            questionField.text = "Correct!"
            loadNextRoundWithDelay(seconds: 2)
        } else {
            incorrectAnswerSound?.play()
            sender.backgroundColor = incorrectButton
            questionField.text = "Nope, sorry!\nThe answer is: \(correctAnswer)"
            loadNextRoundWithDelay(seconds: 2)
        }
    }

    
    
    func displayScore() {
        
        // Hide the answer buttons
        option01.hidden      = true
        option02.hidden      = true
        option03.hidden      = true
        option04.hidden      = true
        questionField.hidden = true
        
        // Ask to play again
        resultsField.hidden = false
        playAgainButton.hidden = false
        
        if correct == maxQuestions {
            resultsField.text = "You passed with flying colors!\n\(correct) out of \(maxQuestions) correct!"
        } else if correct < maxQuestions && correct > 0 {
            resultsField.text = "Not bad!\nYou got \(correct) out of \(maxQuestions) correct!"
        } else {
            resultsField.text = "That was terrible!"
        }
    }
    
    func nextRound() {
        if questionsAsked == maxQuestions {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        
        // Show the answer buttons
        option01.hidden      = false
        option02.hidden      = false
        option03.hidden      = false
        option04.hidden      = false
        questionField.hidden = false
        
        // Ask to play again
        playAgainButton.hidden = true
        resultsField.hidden = true

        questionsAsked = 0
        correct = 0
        nextRound()
    }
    
    func loadNextRoundWithDelay(seconds seconds: Int) {

        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
}

