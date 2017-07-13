//
//  RoundedTextField.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedTextField: UITextField {
    
    var isInvalidTextField = false
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + Constants.Label.padding, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + Constants.Label.padding, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    func resetBorderColor() {
        layer.borderColor = UIColor.pinkishGrey.cgColor
        layer.borderWidth = 0.5
        isInvalidTextField = false
    }
    
    func highlightBorderColor() {
        layer.borderColor = UIColor.tomato.cgColor
        layer.borderWidth = 1.0
        isInvalidTextField = true
    }
    
}
