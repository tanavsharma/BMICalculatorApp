//
//  ViewController.swift
//  BMICalculatorApp
//
//  Created by Tanav Sharma on 2021-12-16.
//

import UIKit

class BMIScreen: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    
    @IBOutlet weak var Label: UIView!
    @IBOutlet weak var ageEt: UIView!
    @IBOutlet weak var genderET: UIView!
    @IBOutlet weak var fnEt: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = UIColor.black
        
        fullName.attributedPlaceholder = NSAttributedString(
            string: " Enter Full Name (e.x. John Doe)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        age.attributedPlaceholder = NSAttributedString(
            string: " Enter Age (e.x. 21)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        gender.attributedPlaceholder = NSAttributedString(
            string: " Enter Gender (e.x. Male)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        createRound(ageEt)
        createRound(genderET)
        createRound(fnEt)
        
        
    }
    
    private func createRound(_ view: UIView){
        view.layer.cornerRadius = 12
    }
    


}

