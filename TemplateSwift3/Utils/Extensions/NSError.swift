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
        return NSError(domain:"No hero data", code:1001, userInfo:nil)
    }
}
