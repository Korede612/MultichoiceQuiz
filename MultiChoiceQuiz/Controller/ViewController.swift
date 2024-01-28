//
//  ViewController.swift
//  MultiChoiceQuiz
//
//  Created by Oko-osi Korede on 28/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentQuiz()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        let isCorrectAnswer = quizBrain.checkAnswer(userAnswer)
        if isCorrectAnswer {
            sender.backgroundColor = .systemGreen
        } else {
            sender.backgroundColor = .systemRed
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        quizBrain.nextQuestion()
        let canFetchNextQuestion = quizBrain.canFetchNextQuestion()
        if canFetchNextQuestion {
            getCurrentQuiz()
            firstChoice.backgroundColor = .clear
            secondChoice.backgroundColor = .clear
            thirdChoice.backgroundColor = .clear
            updateProgressBar()
        } else {
            scoreLabel.text = "Score: \(quizBrain.getQuizScore()) / \(quizBrain.quiz.count)"
            thirdChoice.isEnabled = false
            secondChoice.isEnabled = false
            firstChoice.isEnabled = false
            refreshButton.isHidden = false
        }
    }
    
    func getCurrentQuiz() {
        questionLabel.text = quizBrain.getQuestion()
        firstChoice.setTitle(quizBrain.getFirstChoice(), for: .normal)
        secondChoice.setTitle(quizBrain.getSecondChoice(), for: .normal)
        thirdChoice.setTitle(quizBrain.getThirdChoice(), for: .normal)
        scoreLabel.text = "Score: \(quizBrain.getQuizScore())"
        refreshButton.isHidden = true
    }
    
    func updateProgressBar() {
        progressBar.progress = quizBrain.getProgress()
    }
    @IBAction func refreshQuiz(_ sender: UIButton) {
        thirdChoice.isEnabled = true
        secondChoice.isEnabled = true
        firstChoice.isEnabled = true
        
        firstChoice.backgroundColor = .clear
        secondChoice.backgroundColor = .clear
        thirdChoice.backgroundColor = .clear
        
        quizBrain.refreshQuiz()
        getCurrentQuiz()
    }
}



