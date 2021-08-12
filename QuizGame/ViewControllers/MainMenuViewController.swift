//
//  ViewController.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 11.08.2021.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? GameViewController,
              segue.identifier == "ShowGameViewController"
        else { return }
        let gameSession = GameSession()
        Game.instance.gameSession = gameSession
        destinationVC.delegate = gameSession
    }

}

