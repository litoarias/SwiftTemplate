//
//  UIStoryboard.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>() -> T {
        return instantiateViewController(withIdentifier: T.reuseIdentifier) as! T
    }
    
}
