//
//  ViewController.swift
//  TurkeyCalculator
//
//  Created by Paul Solt on 6/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet var turkeyWeightTextField: UITextField!
    @IBOutlet var cookTimeTextField: UITextField!
    @IBOutlet var metricButton: UIButton!
    
    // Actions
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        guard let turkeyWeightString = turkeyWeightTextField.text else { return }
        
        // see if the text in the text field is a valid Double
        
        guard let turkeyWeight = Double(turkeyWeightString) else {
            print("Invalid number. Unable to init a double from the string.")
            return
        }
        
        // based on the metric button's .isSelected prop, call one of the cook time functions
        var durationInMinutes: Double
        
        if metricButton.isSelected {
            durationInMinutes = cookTimeInKilograms(weight: turkeyWeight)
        } else {
            durationInMinutes = cookTimeInPounds(weight: turkeyWeight)
        }
        
        // Show cook time in minutes
        
        cookTimeTextField.text = "Cook for \(durationInMinutes) minutes"
    }
    
    @IBAction func metricButtonPressed(_ sender: Any) {
        metricButton.isSelected.toggle()
        
    }
    
    // Helper functions
    
    func cookTimeInPounds(weight: Double) -> Double {
        let durationInMinutes = weight * 15.0
        return durationInMinutes
        // could do just
        // return weight * 15.0
    }
    
    func cookTimeInKilograms(weight: Double) -> Double {
        var durationInMinutes: Double
        
        if weight >= 4 {
            durationInMinutes = 20.0 * weight + 90
        } else {
            durationInMinutes = 20.0 * weight + 70
        }
        
        return durationInMinutes
    }
}
