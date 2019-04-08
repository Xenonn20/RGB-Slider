//
//  ViewController.swift
//  RGB Slider
//
//  Created by Кирилл Медведев on 29/03/2019.
//  Copyright © 2019 Kirill Medvedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var colorWindow: UIView!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var redSliderLabel: UISlider!
    @IBOutlet weak var greenSliderLabel: UISlider!
    @IBOutlet weak var blueSliderLabel: UISlider!
    
    @IBOutlet weak var hexTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorWindow.layer.cornerRadius = 40
        hexTextLabel.layer.cornerRadius = 10
        hexTextLabel.clipsToBounds = true
        
        setColor()
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            redTextField.text = String(format: "%.0f", sender.value)
        case 1:
            greenTextField.text = String(format: "%.0f", sender.value)
        case 2:
            blueTextField.text = String(format: "%.0f", sender.value)
        default:
            break
        }
        setColor()
        
    }
    
    
    private func setColor() {
        
        colorWindow.backgroundColor = UIColor(red: Int(redSliderLabel!.value), green: Int(greenSliderLabel!.value), blue: Int(blueSliderLabel!.value))
        
        let color = UIColor(red: Int(redSliderLabel!.value), green: Int(greenSliderLabel!.value), blue: Int(blueSliderLabel!.value))
        let hexString = color.toHexString()
        hexTextLabel.text = hexString
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
}

extension UIColor {
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format:"#%06x", rgb) as String
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
}
