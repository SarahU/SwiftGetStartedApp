//
//  ViewController.swift
//  FoodTracker
//
//  Created by Sarah Usher on 29/10/2017.
//  Copyright © 2017 Sarah Usher. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
                      UITextFieldDelegate, //UITextFieldDelegate has 8 optional methods!
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate

{
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!   //implicitly unwrapped optional - will have a value after it's been initially set
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
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
    
    //MARK: UIImagepickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        animateDismissalOfImagePickerController();
        dismiss(animated: true, completion: nil)
    }
    
//    func animateDismissalOfImagePickerController(){
//        dismiss(animated: true, completion: nil)
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //The info dictionary may contain multiple representations of the image. You want to use the original. it will always have this. An edited version may exist
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info) ")
        }
        
        //Set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        //Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        var _ = hideTheKeyboard(nameTextField)
        
        //UIImagePickerController is a view controller that lets a user pick media from their photo gallery
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text";
    }
    


//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

