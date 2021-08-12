//
//  Game.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 11.08.2021.
//

import Foundation

class Game {
    
    static let instance = Game()
    
    var gameSession: GameSession?
    var results = [Result]()
    var resultCareTaker = ResultsCaretaker()
    
    private init() {
        self.results = resultCareTaker.loadResults()
    }
    
    func calculateResult() {
        guard let gameSession = gameSession
        else { return }
        let result = Result(date: Date(), result: gameSession.progress)
        results.append(result)
        resultCareTaker.saveResults(results: results)
        self.gameSession = nil
    }
}
