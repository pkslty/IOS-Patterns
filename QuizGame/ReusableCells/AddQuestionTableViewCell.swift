//
//  AddQuestionTableViewCell.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 26.08.2021.
//

import UIKit

class AddQuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var rightAnswerLabel: UILabel!
    @IBOutlet weak var rightAnswerText: UITextField!
    @IBOutlet weak var wrongAnswer1Text: UITextField!
    @IBOutlet weak var wrongAnswer2Text: UITextField!
    @IBOutlet weak var wrongAnswer3Text: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(question: Question) {
        self.questionText.text = question.question
        self.rightAnswerText.text = question.answers[0]
        self.wrongAnswer1Text.text = question.answers[1]
        self.wrongAnswer2Text.text = question.answers[2]
        self.wrongAnswer3Text.text = question.answers[3]
    }
    
}
