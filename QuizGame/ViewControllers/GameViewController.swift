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
    
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    var delegate: GameViewControllerDelegate?
    var questions = [Question]()
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = QuestionService.getQuestions()
        answerAButton.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerBButton.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerCButton.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerDButton.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextQuestion()
        
    }
    
    private func nextQuestion() {
        questionLabel.text = questions[currentQuestion].question
        questionNumberLabel.text = "Вопрос № \(currentQuestion + 1)"
        let answers = questions[currentQuestion].answers.shuffled()
        answerAButton.setTitle(answers[0], for: .normal)
        answerBButton.setTitle(answers[1], for: .normal)
        answerCButton.setTitle(answers[2], for: .normal)
        answerDButton.setTitle(answers[3], for: .normal)
        
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
