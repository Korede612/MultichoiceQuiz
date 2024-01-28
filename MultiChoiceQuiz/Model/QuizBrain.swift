//
//  QuizBrain.swift
//  MultiChoiceQuiz
//
//  Created by Oko-osi Korede on 28/01/2024.
//

import Foundation

struct QuizBrain {
    let quiz: [QuizItem]
    var questionNumber = 0
    var score = 0
    
    init() {
        quiz = [
            QuizItem(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
            QuizItem(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
            QuizItem(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
            QuizItem(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
            QuizItem(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
            QuizItem(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
            QuizItem(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
            QuizItem(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
            QuizItem(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
            QuizItem(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        ]
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if quiz[questionNumber].correctAnswer == userAnswer {
            score += 1
            return true
        } else {
            return false
        }
//        return quiz[questionNumber].answer == userAnswer
    }
    
    func getQuestion() -> String {
        return quiz[questionNumber].question
    }
    
    func getFirstChoice() -> String {
        return quiz[questionNumber].answer[0]
    }
    
    func getSecondChoice() -> String {
        return quiz[questionNumber].answer[1]
    }
    
    func getThirdChoice() -> String {
        return quiz[questionNumber].answer[2]
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func canFetchNextQuestion() -> Bool {
        return questionNumber < quiz.count
    }
    
    mutating func nextQuestion() {
        questionNumber += 1
    }
    
    func getQuizScore() -> Int {
        return score
    }
    
    mutating func refreshQuiz() {
        questionNumber = 0
        score = 0
    }
}
