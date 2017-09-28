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
    //@IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    // Outlets for constraint --------------------
    @IBOutlet weak var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    func animateLabelTransitions() {
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                            self.currentQuestionLabel.alpha = 0
                            self.nextQuestionLabel.alpha = 1
                        
                            self.view.layoutIfNeeded()
                       },
                       completion: { _ in
                            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                            swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                        
                            self.updateOffScreenLabel()
                       })
        
        
    }
    
    // Actions
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        nextQuestionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = answers[currentQuestionIndex]
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
}

