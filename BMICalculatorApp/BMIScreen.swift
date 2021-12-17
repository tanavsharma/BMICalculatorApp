//
//  ViewController.swift
//  BMICalculatorApp
//
//  Created by Tanav Sharma on 2021-12-16.
//

import UIKit
import FirebaseDatabase

class BMIScreen: UIViewController {
    private let database = Database.database().reference()

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
    @IBOutlet weak var bmiResultView: UIView!
    
    @IBOutlet weak var bmiResultLabel: UILabel!
    
    var bmiCounter = 0
    var bmiMax = ""
    var bmiName = ""
    
    var mode = ""

    override func viewDidLoad() {
        
        var taskRef: DatabaseReference?
        var refHandle: DatabaseHandle?
        var numberOfBMIs: [String] = []
        
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
            string: " Enter your Gender (e.x. Male)",
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
        createRound(bmiResultView)
        
        
        taskRef = Database.database().reference(withPath: "BMIs")
        refHandle = taskRef?.observe(DataEventType.value, with: { snapshot in
            numberOfBMIs.removeAll()
            for taskSnapshot in snapshot.children {
                let nodeA = taskSnapshot as! DataSnapshot
                let keyA = nodeA.key
                numberOfBMIs.append(keyA)
            }
            self.bmiMax = numberOfBMIs.max()!
        })
        
        
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
        
        weightEt.text = ""
        heightEt.text = ""
        
        
        
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
        
        weightEt.text = ""
        heightEt.text = ""
        
        
        
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
        
        var bmiInformation: [String: String] = [:]
        
        var bmi = 0.0
        var bmiRes = ""
        
        let fn = fullName.text!
        let umar = age.text!
        let sex = gender.text!
        
        let weight:Double! = Double(weightEt.text!)
        let height:Double! = Double(heightEt.text!)
        
        if(weightEt.text!.isEmpty || heightEt.text!.isEmpty || fullName.text!.isEmpty || age.text!.isEmpty || gender.text!.isEmpty){
            let alert = UIAlertController(title: "Fill Every Field", message: "You must fill out all fields to continue",
                                          preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Okay",
                                          style: .default,
                                          handler: nil))

            self.present(alert, animated: true)
            
            
        }else{
            if(mode == "Imperial"){
                
                bmi = (weight*703) / (height * height)
                bmi = round(bmi * 100) / 100.0
            }else if(mode == "Metric"){
               
                bmi = (weight) / (height * height)
                bmi = round(bmi * 100) / 100.0
            }
            
            if(bmi <= 16){
                bmiRes = "Severe Thinness" // blue
                bmiResultView.backgroundColor = .blue
            }else if(bmi >= 16 && bmi <= 17){
                bmiRes = "Moderate Thinness" // blue
                bmiResultView.backgroundColor = .blue
            }else if(bmi >= 17 && bmi <= 18.5){
                bmiRes = "Mild Thinness" // blue
                bmiResultView.backgroundColor = .blue
            }else if(bmi >= 18.5 && bmi <= 25){
                bmiRes = "Normal Thinness"// green
                bmiResultView.backgroundColor = .green
            }else if(bmi >= 25 && bmi <= 30){
                bmiRes = "Overweight" //yellow
                bmiResultView.backgroundColor = .yellow
                bmiResultLabel.textColor = .black
            }else if(bmi >= 30 && bmi <= 35){
                bmiRes = "Obese Class 1" // orange
                bmiResultView.backgroundColor = .orange
            }else if(bmi >= 35 && bmi <= 40){
                bmiRes = "Obese Class 2" // orange
                bmiResultView.backgroundColor = .orange
            }else if(bmi > 40){
                bmiRes = "Obese Class 3" // red
                bmiResultView.backgroundColor = .red
            }
            bmiResultLabel.text = "Your BMI is \(bmi). You are \(bmiRes)"
            bmiCounter = Int(bmiMax)! + 1
            
            bmiInformation["Name"] = fn
            bmiInformation["Age"] = umar
            bmiInformation["Gender"] = sex
            bmiInformation["BMI Value"] = String(bmi)
            bmiInformation["BMI Result"] = bmiRes
            
            

            database.child("BMIs").child("\(bmiCounter)").setValue(bmiInformation)
            
            
        }
    }
    
    
    

}

