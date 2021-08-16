//
//  SettingsViewController.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 15.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var randomQuestionsSwitch: UISwitch!
    
    @IBAction func randomQuestionSwitchTap(_ sender: Any) {
        Game.instance.randomQuestions = randomQuestionsSwitch.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomQuestionsSwitch.isOn = Game.instance.randomQuestions
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
