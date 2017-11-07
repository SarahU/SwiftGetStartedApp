//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Sarah Usher on 02/11/2017.
//  Copyright © 2017 Sarah Usher. All rights reserved.
//

import UIKit

@IBDesignable
class RatingControl: UIStackView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    var rating = 0  //default (internal) access
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5{
        didSet{
            setupButtons()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButtons()
    }
    
    func clearExistingButtons(){
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
    }
    
    private func setupButtons(){
        clearExistingButtons()
        createImageButtons()
    }
    
    private func createImageButtons(){
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount{
            let button = createButton(emptyStar: emptyStar!, filledStar: filledStar!, highlightedStar: highlightedStar!)
            addConstraintsToButton(button: button)
            setupButtonAction(button: button)
            addButtonToStack(button: button)
            ratingButtons.append(button)
        }
    }
    
    private func createButton(emptyStar: UIImage, filledStar: UIImage, highlightedStar: UIImage) -> UIButton{
        let button = UIButton()  //convenience initializer - calls init(frame:) and passes zero-sized rectangle (ok because using Auto Layout)
        button.setImage(emptyStar, for: .normal)
        button.setImage(filledStar, for: .selected)
        button.setImage(highlightedStar, for: .highlighted)
        button.setImage(highlightedStar, for: [.highlighted, .selected])
        
        return button
    }
    
    private func addConstraintsToButton(button: UIButton){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
    }
    
    private func setupButtonAction(button: UIButton){
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)  //because using #selector, need to expose hooked up method (ratingButtonTapped) to objc runtime
    }
    
    private func addButtonToStack(button: UIButton){
        addArrangedSubview(button)
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        print("Button pressed \(button.hashValue)") //will log to debug console
    }
}
