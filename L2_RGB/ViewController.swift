//
//  ViewController.swift
//  L2_RGB
//
//  Created by Алексей Корзин on 24.05.2020.
//  Copyright © 2020 Алексей Корзин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var redIntensity: CGFloat = 0.05
    var greenIntensity: CGFloat = 0.27
    var blueIntensity: CGFloat = 0.49
    
    func changeColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        colorView.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
    
    func roundToTwo(number: Float) -> Float {
        round((number) * 100) / 100
    }
    
    func valueToLabel(colorSliderValue: Float, colorLabel: UILabel) {
        let colorIntensityRound = roundToTwo(number: colorSliderValue)
        colorLabel.text = String(colorIntensityRound)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        changeColor(red: redIntensity, green: greenIntensity, blue: blueIntensity)
        
        redSlider.maximumTrackTintColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 0.2)
        greenSlider.maximumTrackTintColor = UIColor(displayP3Red: 0, green: 1, blue: 0, alpha: 0.2)
        blueSlider.maximumTrackTintColor = UIColor(displayP3Red: 0, green: 0, blue: 1, alpha: 0.2)
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.setValue(Float(redIntensity), animated: false)
        greenSlider.setValue(Float(greenIntensity), animated: false)
        blueSlider.setValue(Float(blueIntensity), animated: false)
        
        valueToLabel(colorSliderValue: redSlider.value, colorLabel: redLabel)
        valueToLabel(colorSliderValue: greenSlider.value, colorLabel: greenLabel)
        valueToLabel(colorSliderValue: blueSlider.value, colorLabel: blueLabel)
        
    }
    
    @IBAction func redSliderAction() {
        redIntensity = CGFloat(redSlider.value)
        valueToLabel(colorSliderValue: redSlider.value, colorLabel: redLabel)
        changeColor(red: redIntensity, green: greenIntensity, blue: blueIntensity)
    }
    
    @IBAction func greenSliderAction() {
        greenIntensity = CGFloat(greenSlider.value)
        valueToLabel(colorSliderValue: greenSlider.value, colorLabel: greenLabel)
        changeColor(red: redIntensity, green: greenIntensity, blue: blueIntensity)
    }
    
    @IBAction func blueSliderAction() {
        blueIntensity = CGFloat(blueSlider.value)
        valueToLabel(colorSliderValue: blueSlider.value, colorLabel: blueLabel)
        changeColor(red: redIntensity, green: greenIntensity, blue: blueIntensity)
    }
    
    
}

