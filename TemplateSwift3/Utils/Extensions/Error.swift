//
//  Error.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

extension Error {
    
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
    var message: String { return (self as NSError).localizedDescription }
}
