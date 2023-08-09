//
//  ResultViewController.swift
//  QuizAppTestInfo
//
//  Created by Goodwasp on 08.08.2023.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var gameLabel: UILabel!
    @IBOutlet var gameDescriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        showResultGame()
    }
    
    // MARK: - IB Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

//MARK: - Private func
extension ResultViewController {
    private func calculateMostFrequenceGame(from answers: [Answer]) -> Game {
        let games = answers.map { $0.game }
        
        var countOfGames: [Game: Int] = [:]
        
        games.forEach { game in
            guard let count = countOfGames[game] else {
                countOfGames.updateValue(1, forKey: game)
                return
            }
            countOfGames.updateValue(count + 1, forKey: game)
        }
        
        guard let mostFrequenceGame = countOfGames.sorted(by: { $0.value > $1.value }).first?.key else {
            return .alias
        }
        
        return mostFrequenceGame
    }
    
    private func showResultGame() {
        let resultGame = calculateMostFrequenceGame(from: answers)
        gameLabel.text = "Игра – \(resultGame.rawValue)"
        gameDescriptionLabel.text = resultGame.definition
    }
    
}
