//
//  ViewController.swift
//  Conversores
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var unit1Button: UIButton!
    @IBOutlet weak var unit2Button: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultUnitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch unitLabel.text {
            case "Temperatura":
                unitLabel.text = "Peso"
                unit1Button.setTitle("Kilograma", for: .normal)
                unit2Button.setTitle("Libra", for: .normal)
            case "Peso":
                unitLabel.text = "Moeda"
                unit1Button.setTitle("Real", for: .normal)
                unit2Button.setTitle("Dolar", for: .normal)
            case "Moeda":
                unitLabel.text = "Distancia"
                unit1Button.setTitle("Metro", for: .normal)
                unit2Button.setTitle("Kilometro", for: .normal)
            default:
                unitLabel.text = "Temperatura"
                unit1Button.setTitle("Celsius", for: .normal)
                unit2Button.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == unit1Button {
                unit2Button.alpha = 0.5
            } else {
                unit1Button.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch unitLabel.text {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        
        view.endEditing(true)
        let result = Double(resultLabel.text!)!
        resultLabel.text = String(format: "%.2f", result)
    }
    
    func calcTemperature() {
        guard let temperature = Double(valueTextField.text!) else { return }
        
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Farenheint"
            resultLabel.text = String(temperature * 1.8 + 32.0)
        } else {
            resultUnitLabel.text = "Celsius"
            resultLabel.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(valueTextField.text!) else { return }
        
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Libra"
            resultLabel.text = String(weight / 2.2046)
        } else {
            resultUnitLabel.text = "Kilograma"
            resultLabel.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency() {
        guard let currency = Double(valueTextField.text!) else { return }
        
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Dolar"
            resultLabel.text = String(currency / 3.5)
        } else {
            resultUnitLabel.text = "Real"
            resultLabel.text = String(currency / 3.5)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(valueTextField.text!) else { return }
        
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Kilometro"
            resultLabel.text = String(distance / 1000.0)
        } else {
            resultUnitLabel.text = "Metro"
            resultLabel.text = String(distance * 1000.0)
        }
    }
}

