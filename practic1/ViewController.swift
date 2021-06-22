//
//  ViewController.swift
//  practic1
//
//  Created by Zhuravlev Lev on 22.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var oneMoreTimeButton: UIButton!
    @IBOutlet weak var inputField: UITextField!
    
    var a: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.delegate = self
        start()
    }
    
    @IBAction func oneMoreTimeButtonTouched(_ sender: Any) {
        start()
    }
    
    func start() {
        oneMoreTimeButton.isHidden = true
        answerLabel.text = ""
        inputField.isEnabled = true
        inputField.text = ""
        messageLabel.text = "Я загадал число от 0 до 100 \n а ты отгадай"
        a = Int.random(in: 0...100)
        inputField.becomeFirstResponder()
    }
    
    func chekingNumber(_ number_b: Int) {
        guard let number_a = a else {
            return
        }
        
        if number_b < number_a {
            answerLabel.text = "Мало"
        } else if number_b > number_a {
            answerLabel.text = "Много"
        } else {
            messageLabel.text = "Это было число \(number_b) "
            answerLabel.text = "Угадал 🎉"
            oneMoreTimeButton.isHidden = false
            inputField.resignFirstResponder()
            inputField.isEnabled = false
            
        }
    }
}

extension ViewController: UITextFieldDelegate {
   
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let number = textField.text else {
            return }
        answerLabel.text = ""
        guard number != "" else {
            return
        }
        chekingNumber(Int(number)!)
    }
}
