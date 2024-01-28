//
//  QuizItem.swift
//  MultiChoiceQuiz
//
//  Created by Oko-osi Korede on 28/01/2024.
//

import Foundation

struct QuizItem {
    let question: String
    let answer: [String]
    let correctAnswer: String
}

extension QuizItem {
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
