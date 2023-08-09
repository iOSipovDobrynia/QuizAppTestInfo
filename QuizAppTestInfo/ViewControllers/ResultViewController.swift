//
//  ResultViewController.swift
//  QuizAppTestInfo
//
//  Created by Goodwasp on 08.08.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - IB Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}
