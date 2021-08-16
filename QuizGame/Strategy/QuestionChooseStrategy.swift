//
//  QuestionChooseStrategy.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 15.08.2021.
//

import Foundation

protocol QuestionChooseStrategy {
    func getQuestions() -> [Question]
}
