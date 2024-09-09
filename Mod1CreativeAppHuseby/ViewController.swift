//
//  ViewController.swift
//  Mod1CreativeAppHuseby
//
//  Created by DANIEL HUSEBY on 8/22/24.
//

import UIKit
class AppData{
    static var animal = 0
}
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var paperOutlet: UITextField!
    
    @IBOutlet weak var peopleOutlet: UITextField!
    
    @IBOutlet weak var orangeButtonOutlet: UIButton!
    
    @IBOutlet weak var greenButtonOutlet: UIButton!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paperOutlet.delegate = self
        peopleOutlet.delegate = self
        // Do any additional setup after loading the view.
        orangeButtonOutlet.layer.cornerRadius = 5
        greenButtonOutlet.layer.cornerRadius = 5
    }
    func createAlert(alertTitle: String, alertDesc: String){
        let alert = UIAlertController(title: alertTitle, message: alertDesc, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func imageAction(_ sender: Any) {
        if (AppData.animal != 0){
            performSegue(withIdentifier: "toAnimalSegue", sender: nil)
        }
    }
    
    
    @IBAction func divideAction(_ sender: Any) {
        paperOutlet.resignFirstResponder()
        peopleOutlet.resignFirstResponder()
        if let blah = Int(paperOutlet.text!), let blah2 = Int(peopleOutlet.text!){
            if (blah > 0) && ( blah2 > 0) && (blah2<=10){
                AppData.animal = 4
                buttonOutlet.setBackgroundImage(UIImage(named: "dartMonkey"), for: .normal)
                var result = 0
                if (blah==1){
                    result = 1
                }else if(blah2<3){
                    result = 2
                }else if(blah2<6){
                    result = 4
                }else if(blah2<9){
                    result = 8
                }else{
                    result = 20
                }
                result = result*blah
                labelOutlet.text = "\(result) minutes required to complete the homework"
            }else{
                AppData.animal = 2
                createAlert(alertTitle: "Unusuable numbers", alertDesc: "The numbers are not acceptable. It might be negative or not in range ")
                buttonOutlet.setBackgroundImage(UIImage(named: "angryMonkey"), for: .normal)
            }
        }else{
            AppData.animal = 1
            createAlert(alertTitle: "Insert a number", alertDesc: "Type in a number (has to be an integer)")
            buttonOutlet.setBackgroundImage(UIImage(named: "angryDog"), for: .normal)
        }
    }
    
    @IBAction func multiplyAction(_ sender: Any) {
        paperOutlet.resignFirstResponder()
        peopleOutlet.resignFirstResponder()
        if let blah = Int(paperOutlet.text!), let blah2 = Int(peopleOutlet.text!){
            if (blah > 0) && (blah2 > 0) && (blah2<=10){
                AppData.animal = 3
                buttonOutlet.setBackgroundImage(UIImage(named: "puppyDog"), for: .normal)
                var result = 0
                if (blah==1){
                    result = 1
                }else if(blah2<3){
                    result = 2
                }else if(blah2<6){
                    result = 4
                }else if(blah2<9){
                    result = 8
                }else{
                    result = 20
                }
                result = result*blah
                if result <= 5{
                    labelOutlet.text = "Not important, just do it in a study hall before class!"
                }else if result <= 15{
                    labelOutlet.text = "Do it before school tomorrow"
                }else if result <= 40{
                    labelOutlet.text = "Get it done before going to bed"
                }else{
                    labelOutlet.text = "Start working on it right now!"
                }
            }else{
                AppData.animal = 2
                createAlert(alertTitle: "Unusuable numbers", alertDesc: "The numbers are not acceptable. It might be negative or not in range ")
                buttonOutlet.setBackgroundImage(UIImage(named: "angryMonkey"), for: .normal)
            }
        }else{
            AppData.animal = 1
            createAlert(alertTitle: "Insert a number", alertDesc: "Type in a number (has to be an integer)")
            buttonOutlet.setBackgroundImage(UIImage(named: "angryDog"), for: .normal)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    

}

