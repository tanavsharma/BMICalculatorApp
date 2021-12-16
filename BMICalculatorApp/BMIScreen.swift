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
    @IBOutlet weak var weightEt: UITextField!
    @IBOutlet weak var heightEt: UITextField!

    @IBOutlet weak var meaurementView: UIStackView!
 
    @IBOutlet weak var metricBtn: UIButton!
    @IBOutlet weak var imperial: UIButton!
    
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var metricBtnView: UIView!
    @IBOutlet weak var imperialBtnView: UIView!
    @IBOutlet weak var Label: UIView!
    @IBOutlet weak var ageEt: UIView!
    @IBOutlet weak var genderET: UIView!
    @IBOutlet weak var fnEt: UIView!
    @IBOutlet weak var calcuView: UIView!
    
    
    
    var mode = ""

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
            string: " Enter your weight (e.x. Male)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        

        
        createRound(ageEt)
        createRound(genderET)
        createRound(fnEt)
        createRound(metricBtnView)
        createRound(imperialBtnView)
        createRound(weightView)
        createRound(heightView)
        createRound(calcuView)
        
        
    }
    
    private func createRound(_ view: UIView){
        view.layer.cornerRadius = 12
    }
    
    @IBAction func metric(_ sender: Any) {
        mode = "Metric"
        
        
        metricBtnView.backgroundColor = .blue
        metricBtn.setTitleColor(.white, for:.normal)
        
        imperial.setTitleColor(UIColor(red: 20/255, green: 117/255, blue: 255/255, alpha: 1), for:.normal)
        imperialBtnView.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
        
        
        
        
        weightEt.attributedPlaceholder = NSAttributedString(
            string: " Enter Weight in KG",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        heightEt.attributedPlaceholder = NSAttributedString(
            string: " Enter Height in Meters",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        
    }
    
    @IBAction func imperial(_ sender: Any) {
        mode = "Imperial"
        
        
        metricBtnView.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
        metricBtn.setTitleColor(UIColor(red: 20/255, green: 117/255, blue: 255/255, alpha: 1), for:.normal)
        
        imperial.setTitleColor(.white, for:.normal)
        imperialBtnView.backgroundColor = .blue
        
        
        
        weightEt.attributedPlaceholder = NSAttributedString(
            string: " Enter Weight in LBS",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        heightEt.attributedPlaceholder = NSAttributedString(
            string: " Enter Height in Inches",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        
        var bmi = 0.0
        
        let weight:Double! = Double(weightEt.text!)
        let height:Double! = Double(heightEt.text!)
        
        if(mode == "Imperial"){
            print(mode)
            bmi = (weight*703) / (height * height)
        }else if(mode == "Metric"){
            print(mode)
            bmi = (weight) / (height * height)
        }
        print(bmi)
    }
    
    
    

}

