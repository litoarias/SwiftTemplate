//
//  UIView.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

extension UIView {
    
    func superview<T>(ofType type: T.Type) -> T? where T: UIView {
        return superview as? T ?? superview?.superview(ofType: type)
    }
    
    func subviews<T>(ofType type: T.Type) -> [T] where T: UIView {
        var subviews: [T] = []
        for view in self.subviews {
            if let tView = view as? T {
                subviews.append(tView)
            }
            let viewSubviews = view.subviews(ofType: T.self)
            subviews = Array([subviews, viewSubviews].joined())
        }
        return subviews
    }
}
