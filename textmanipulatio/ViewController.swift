//
//  ViewController.swift
//  textmanipulatio
//
//  Created by Mario Perozo on 4/11/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var originalLabel: UILabel!
    @IBOutlet weak var reversedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func removeSpecialCharsFromString(text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return String(text.filter {okayChars.contains($0) })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let word: String = textField.text!.lowercased();
        var formattedWord = word.replacingOccurrences(of: " ", with: "")
        formattedWord = removeSpecialCharsFromString(text: formattedWord);
        var drow = word.replacingOccurrences(of: " ", with: "");
        drow = removeSpecialCharsFromString(text: drow);
        drow = String(formattedWord.reversed());
        
        originalLabel.text = formattedWord
        reversedLabel.text = drow;
        
        if formattedWord == drow {
            label.text = "The word or sentence is a Palindrome"
        }
        else {
            label.text = "The word or sentence is NOT a Palindrome"
        }
        
        
    }
}
