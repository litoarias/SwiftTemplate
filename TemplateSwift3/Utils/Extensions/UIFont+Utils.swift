//
//  UIFont+Utils.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func SFTextRegular(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: Constants.Font.SFTextRegular, size: size)
    }
    
    static func SFTextLight(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: Constants.Font.SFTextLight, size: size)
    }
    
    static func SFTextMedium(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: Constants.Font.SFTextMedium, size: size)
    }
    
    
}
