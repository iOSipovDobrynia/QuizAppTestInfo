//
//  ResultViewController.swift
//  QuizAppTestInfo
//
//  Created by Goodwasp on 08.08.2023.
//

import UIKit

class ResultViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var gameLabel: UILabel!
    @IBOutlet var gameDescriptionLabel: UILabel!
    
    // MARK: - Public Properties
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
        let countOfGames = countGames(from: answers)
        
        guard let mostFrequenceGame = countOfGames.sorted(by: { $0.value > $1.value }).first?.key else {
            return .alias
        }
        
        return mostFrequenceGame
    }
    
    private func countGames(from answers: [Answer]) -> [Game: Int] {
        var countOfGames: [Game: Int] = [:]
        
        answers.forEach { answer in
            let game = answer.game
            
            countOfGames[game, default: 0] += 1
        }
        return countOfGames
    }
    
    private func showResultGame() {
        let resultGame = calculateMostFrequenceGame(from: answers)
        gameLabel.text = "Игра – \(resultGame.rawValue)"
        gameDescriptionLabel.text = resultGame.definition
    }
    
}

