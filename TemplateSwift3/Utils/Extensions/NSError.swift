//
//  NSError.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 31/7/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

extension NSError {
    
    static func parseError() -> NSError {
        return NSError(domain:"Error in data mapping", code:1000, userInfo:nil)
    }
    
    static func emptyDataError() -> NSError {
        return NSError(domain:"No data data", code:1001, userInfo:nil)
    }
    
    static func timeoutError() -> NSError {
        return NSError(domain:"Reuqest timeout", code:1002, userInfo:nil)
    }
    
    
    static func almofireParse(_ error: Error) -> NSError {
        return NSError(domain:error.domain, code:error.code, userInfo:["description" : error.localizedDescription, "message" : error.message])
    }
}
