//
//  RandomQuestionStrategy.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 15.08.2021.
//

import Foundation

class RandomQuestionStrategy: QuestionChooseStrategy {
    
    func getQuestions() -> [Question] {
        QuestionService.getQuestions().shuffled()
    }
    
}
