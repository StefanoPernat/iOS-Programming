//
//  ViewController.swift
//  Quiz
//
//  Created by Stefano Pernat on 26/08/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Outlets ------------------------------
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    // The Model 
    let questions = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    let answers = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int = 0
    
    // Actions
    @IBAction func showNextQuestion(_ sender: UIButton) {
        
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        
    }
}

