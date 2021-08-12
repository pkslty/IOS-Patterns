//
//  GameViewController.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 11.08.2021.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func saveGameResults(solvedQuestions: Int, maxQuestionsCount: Int)
}

class GameViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    var delegate: GameViewControllerDelegate?
    var questions = [Question]()
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = QuestionService.getQuestions()
        answerA.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerB.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerC.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerD.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextQuestion()
        
    }
    
    private func nextQuestion() {
        questionLabel.text = questions[currentQuestion].question
        questionNumberLabel.text = "Вопрос № \(currentQuestion + 1)"
        let answers = questions[currentQuestion].answers.shuffled()
        answerA.setTitle(answers[0], for: .normal)
        answerB.setTitle(answers[1], for: .normal)
        answerC.setTitle(answers[2], for: .normal)
        answerD.setTitle(answers[3], for: .normal)
        
    }
    
    @objc private func checkAnswer(sender: UIButton) {
        let answer = sender.title(for: .normal)
        if answer == questions[currentQuestion].answers.first {
            currentQuestion += 1
            if currentQuestion < questions.count {
                nextQuestion()
            }
            else {
                endGame(title: "Поздравляю!", message: "Вы ответили на все вопросы")
            }

        }
        else {
            endGame(title: "Очень жаль!", message: "Ответ неправильный")
        }
    }
    
    private func endGame(title: String, message: String) {
        delegate?.saveGameResults(solvedQuestions: currentQuestion, maxQuestionsCount: questions.count)
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
}
