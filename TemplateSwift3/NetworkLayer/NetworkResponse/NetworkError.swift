//
//  NetworkError.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 18/8/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

/// `NetworkError` is the encapsulation Error used in this network layer
///
/// `ErrorObject` Typealias for set name, the type data what return it's a tuple of two values
///  In this exapmple case using three possible cases, you can add more required cases
/// - timeoutError:   Returned when the connection time expired
/// - noInternet:     Returned when Internet connection is not available
/// - basicError:     Returned when error basic app, getting body server response what if you want manage data

typealias ErrorObject = (NSError, Data?)

enum NetworkError {
    
    case timeoutError(_: ErrorObject)
    case noInternet(_: ErrorObject)
    case basicError(_: ErrorObject)
    
    init?(error: NSError, data: Data) {
        
        if error._code == NSURLErrorTimedOut {
            let errorObject: ErrorObject = (NSError.timeout(), data)
            self = .timeoutError(errorObject)
            return
        }
        
        if error._code == NSURLErrorNotConnectedToInternet {            
            let errorObject: ErrorObject = (NSError.internet(), data)
            self = .noInternet(errorObject)
            return
        }
        
        let errorObject: ErrorObject = (NSError.basic(error, body: data), data)
        self = .basicError(errorObject)
        
    }
}
