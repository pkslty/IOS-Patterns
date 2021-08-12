//
//  GameSession.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 11.08.2021.
//

import Foundation

class GameSession: GameViewControllerDelegate {
    
    func saveGameResults(solvedQuestions: Int, maxQuestionsCount: Int) {
        self.solvedQuestions = solvedQuestions
        self.maxQuestionsCount = maxQuestionsCount
        Game.instance.calculateResult()
    }
    
    
    enum Clue {
        case friendAnswer
        case spectatorsOpinion
        case fiftyfifty
    }
    
    let questionValue = 100
    var maxQuestionsCount: Int = 0
    var solvedQuestions: Int = 0
    var prize: Int { solvedQuestions * questionValue}
    var progress: Double {Double(solvedQuestions) / Double(maxQuestionsCount) * 100}
    


}
		
