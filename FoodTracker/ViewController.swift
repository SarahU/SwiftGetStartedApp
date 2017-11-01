//
//  ViewController.swift
//  FoodTracker
//
//  Created by Sarah Usher on 29/10/2017.
//  Copyright © 2017 Sarah Usher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {   //UITextFieldDelegate has 8 optional methods!
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!   //implicitly unwrapped optional - will have a value after it's been initially set
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up delegate callback
        nameTextField.delegate = self
    }
    
    //MARK: UITextFieldDelegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return hideTheKeyboard(textField);
    }
    
    func hideTheKeyboard(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text";
    }
    


//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

