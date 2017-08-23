//
//  NSError.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 31/7/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

extension NSError {
    
    static func parsing() -> NSError {
        return NSError(domain:"MYCustomDomain", code:1000, userInfo:["description" : "", "message" : ""])
    }
    
    static func empty() -> NSError {
        return NSError(domain:"MYCustomDomain", code:1001, userInfo:["description" : "No data", "message" : "No data"])
    }
    
    static func timeout() -> NSError {
        return NSError(domain:"MYCustomDomain", code:1002, userInfo:["description" : "Request timeout", "message" : "Request timeout"])
    }
    
    static func internet() -> NSError {
        return NSError(domain:"MYCustomDomain", code:1003, userInfo:["description" : "No internet available", "message" : "No internet available"])
    }
    
    static func basic(_ error: Error, body: Data?) -> NSError {
        // If you want getting body of respons for custom server errors, using this method
        if let data = body, let stringJson = data.getBodyData()  {
            if !(stringJson.characters.count == 0) && !(stringJson.characters.count == 2), let entityError = EntityError.mapping(body: stringJson) {
                return NSError(domain:error.domain, code:error.code, userInfo: entityError.toJSON())
            }
        }
        return NSError(domain:error.domain, code:error.code, userInfo:["description" : error.localizedDescription, "message" : error.message])
    }
}

