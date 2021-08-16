//
//  GameViewController.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 11.08.2021.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    var currentQuestionText: String { get }
    var currentAnswers: [String] { get }
    var endGameTitle: String { get }
    var endGameMessage: String { get }
    var currentQuestion: Observable<Int> { get }
    func saveGameResults()
    func checkAnswer(answer: Int) -> Bool
    
}

class GameViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    var delegate: GameViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        answerAButton.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerAButton.tag = 0
        answerBButton.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerBButton.tag = 1
        answerCButton.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerCButton.tag = 2
        answerDButton.addTarget(self, action: #selector(checkAnswer), for: .touchDown)
        answerDButton.tag = 3
        delegate?.currentQuestion.addObserver(self,  options: [.initial, .new], closure: {[weak self] value, _ in
            guard let self = self else { return }
            self.questionNumberLabel.text = "Вопрос №\(value + 1)"
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextQuestion()
        
    }
    
    private func nextQuestion() {
        guard let delegate = delegate else { return }
        questionLabel.text = delegate.currentQuestionText
        answerAButton.setTitle("Вариант A: \(delegate.currentAnswers[0])", for: .normal)
        answerBButton.setTitle("Вариант B: \(delegate.currentAnswers[1])", for: .normal)
        answerCButton.setTitle("Вариант C: \(delegate.currentAnswers[2])", for: .normal)
        answerDButton.setTitle("Вариант D: \(delegate.currentAnswers[3])", for: .normal)
        
    }
    
    @objc private func checkAnswer(sender: UIButton) {
        guard let delegate = delegate else { return }
        if delegate.checkAnswer(answer: sender.tag) {
            endGame(title: delegate.endGameTitle, message: delegate.endGameMessage)
        } else {
            nextQuestion()
        }
    }
    
    private func endGame(title: String, message: String) {
        delegate?.currentQuestion.removeObserver(self)
        delegate?.saveGameResults()
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
