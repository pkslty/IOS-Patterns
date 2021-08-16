//
//  GameSession.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 11.08.2021.
//

import Foundation

class GameSession: GameViewControllerDelegate {
    
    func checkAnswer(answer: Int) -> Bool {
        if currentAnswers[answer] != questions[currentQuestion.value].answers.first {
            endGameTitle = "Очень жаль"
            endGameMessage = "Ответ неправильный"
            return true
        } else {
            solvedQuestions += 1
            if currentQuestion.value + 1 == questions.count {
                endGameTitle = "Поздравляю!"
                endGameMessage = "Вы ответили на все вопросы"
                return true
            } else {
                currentQuestion.value += 1
                currentAnswers = questions[currentQuestion.value].answers.shuffled()
                return false
            }
        }
    }
    
    
    init() {
        self.questionsChooseStrategy = Game.instance.randomQuestions ?
            RandomQuestionStrategy() :
            SimpleQuestionStrategy()
        self.questions = questionsChooseStrategy.getQuestions()
        currentAnswers = questions[currentQuestion.value].answers.shuffled()
    }
    
    func saveGameResults() {
        Game.instance.calculateResult()
    }
    
    
    enum Clue {
        case friendAnswer
        case auditoryOpinion
        case fiftyfifty
    }
    
    let questionValue = 100
    var solvedQuestions: Int = 0
    var prize: Int { currentQuestion.value * questionValue}
    var result: Double {Double(solvedQuestions) / Double(questions.count) * 100}
    var currentQuestion = Observable<Int>(0)
    var currentQuestionText: String {
        questions[currentQuestion.value].question
    }
    var currentAnswers: [String]
    var questions: [Question]
    var questionsChooseStrategy: QuestionChooseStrategy
    var endGameTitle: String = ""
    var endGameMessage: String = ""

}
		
