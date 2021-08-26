//
//  AddQuestionsTableViewController.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 26.08.2021.
//

import UIKit

class AddQuestionsTableViewController: UITableViewController {

    var quesions: [Question]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quesions = QuestionService.getQuestions()
        
        tableView.register(UINib(nibName: "AddQuestionTableViewCell", bundle: nil), forCellReuseIdentifier: "AddQuestionTableViewCell")

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewQuestion))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quesions.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddQuestionTableViewCell", for: indexPath) as?
                AddQuestionTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(question: quesions[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            quesions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    @objc private func addNewQuestion() {
        let questionText = "Новый вопрос"
        let answers = ["Правильный ответ",
                        "Неправильный ответ №1",
                        "Неправильный ответ №2",
                        "Неправильный ответ №3"]
        let question = Question(question: questionText,
                                answers: answers,
                                friendAnswer: "",
                                spectatorsOpinion: 0)
        quesions.append(question)
        tableView.reloadData()
        let indexPath = IndexPath(row: quesions.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        QuestionService.updateQuestions(questions: quesions)
    }
    
}
