//
//  ResultCell.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 12.08.2021.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    func configure(date: Date, result: Double) {
        dateLabel.text = date.description
        resultLabel.text = "Правильных ответов: \(result)%"
    }

   
    
}
