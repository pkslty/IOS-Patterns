//
//  SimpleQuestionStrategy.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 15.08.2021.
//

import Foundation

class SimpleQuestionStrategy: QuestionChooseStrategy {
    
    func getQuestions() -> [Question] {
        QuestionService.getQuestions()
    }
    
}
