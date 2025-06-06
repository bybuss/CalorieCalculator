//
//  FirstViewController.swift
//  Calculator
//
//  Created by Никита Светличный on 08.05.2025.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var activitySegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var salatImage: UIImageView!
    @IBOutlet weak var salatText: UILabel!
    
    @IBAction func calculateTapped(_ sender: Any) {
        var bmr: Double = 0
        var bmi: Double = 0
        
        
        if let age = Int(ageTextField.text ?? ""),
           let height = Int(heightTextField.text ?? ""),
           let weight = Int(weightTextField.text ?? "")
        {
            switch sexSegmentedControl.selectedSegmentIndex {
            case 0:
                bmr = 88.362
                    + 13.397 * Double(weight)
                    + 4.799 * Double(height)
                    - 5.677 * Double(age)
                
            case 1: 
                bmr = 447.593
                    + 9.247 * Double(weight)
                    + 3.098 * Double(height)
                    - 4.330 * Double(age)
                
            default:
                break
            }
            
            bmi = Double(weight) / pow(Double(height) / 100, 2)
        }
        
        let activityFactors = [1.375, 1.55, 1.725, 1.9]
        let selectedFactor = activitySegmentedControl.selectedSegmentIndex < activityFactors.count
            ? activityFactors[activitySegmentedControl.selectedSegmentIndex]
            : 1.0
        
        bmr *= selectedFactor
        
        resultLabel.text = """
            Вы должны потреблять \(Int(bmr)) килокалорий для поддержания веса.
            Индекс массы тела \(Int(bmi)).
            """
        
        salatImage.isHidden = false
        salatText.isHidden = false
        
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        salatImage.isHidden = true
        salatText.isHidden = true
        // Do any additional setup after loading the view.
    }

}
