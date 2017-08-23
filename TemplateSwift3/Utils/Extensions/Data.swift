//
//  BodyExtractor.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 19/8/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

extension Data {
    
    func getBodyData() -> String? {
        if let str = String(data: self, encoding: String.Encoding.utf8) {
            return str
        }
        return nil
    }
    
}
