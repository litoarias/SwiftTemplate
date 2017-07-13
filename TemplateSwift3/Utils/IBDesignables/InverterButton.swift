//
//  InverterButton.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

@IBDesignable
public class InverterButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
            setTitleColor(borderColor, for: .normal)
        }
    }
    
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = radius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var invert: Bool = false {
        didSet {
            backgroundColor = borderColor
            setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
    }
}

