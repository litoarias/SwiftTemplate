//
//  NSError.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 31/7/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

extension NSError {
    
    static func parseError(_ error: Error, body: Data?) -> NSError {
        // If you want getting body of respons for custom server errors, using this method
        if let data = body, let stringJson = data.getBodyData()  {
            if !(stringJson.characters.count == 0) && !(stringJson.characters.count == 2), let entityError = EntityError.mapping(body: stringJson) {
                if !entityError.isNil() {
                    return NSError(domain:error.domain, code:error.code, userInfo: entityError.toJSON())
                }
            }
        }
        return basic(error)
    }
    
    static func basic(_ error: Error) -> NSError {
        return NSError(domain:error.domain, code:error.code, userInfo:["description" : error.localizedDescription, "message" : error.message])
    }
    
    static func noConnection() -> NSError {
        if let bundleIdentifier =  Bundle.main.bundleIdentifier {
            return NSError(domain:bundleIdentifier, code:9999, userInfo:[:])
        }
        return NSError(domain:"com.bundle.app", code:999, userInfo:[:])
    }
    
    //    static func parsing() -> NSError {
    //        return NSError(domain:"MYCustomDomain", code:1000, userInfo:["description" : "", "message" : ""])
    //    }
    //
    //    static func empty() -> NSError {
    //        return NSError(domain:"MYCustomDomain", code:1001, userInfo:["description" : "No data", "message" : "No data"])
    //    }
    //
    //    static func timeout() -> NSError {
    //        return NSError(domain:"MYCustomDomain", code:1002, userInfo:["description" : "Request timeout", "message" : "Request timeout"])
    //    }
    //
    //    static func internet() -> NSError {
    //        return NSError(domain:"MYCustomDomain", code:1003, userInfo:["description" : "No internet available", "message" : "No internet available"])
    //    }
    
    //            if let error = response.result.error as? AFError {
    //                switch error {
    //                case .invalidURL(let url):
    //                    print("Invalid URL: \(url) - \(error.localizedDescription)")
    //                case .parameterEncodingFailed(let reason):
    //                    print("Parameter encoding failed: \(error.localizedDescription)")
    //                    print("Failure Reason: \(reason)")
    //                case .multipartEncodingFailed(let reason):
    //                    print("Multipart encoding failed: \(error.localizedDescription)")
    //                    print("Failure Reason: \(reason)")
    //                case .responseValidationFailed(let reason):
    //                    print("Response validation failed: \(error.localizedDescription)")
    //                    print("Failure Reason: \(reason)")
    //
    //                    switch reason {
    //                    case .dataFileNil, .dataFileReadFailed:
    //                        print("Downloaded file could not be read")
    //                    case .missingContentType(let acceptableContentTypes):
    //                        print("Content Type Missing: \(acceptableContentTypes)")
    //                    case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
    //                        print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
    //                    case .unacceptableStatusCode(let code):
    //                        print("Response status code was unacceptable: \(code)")
    //                        statusCode = code
    //                    }
    //                case .responseSerializationFailed(let reason):
    //                    print("Response serialization failed: \(error.localizedDescription)")
    //                    print("Failure Reason: \(reason)")
    //                    // statusCode = 3840 ???? maybe..
    //                }
    //
    //                print("Underlying error: \(String(describing: error.underlyingError))")
    //            } else if let error = response.result.error as? URLError {
    //                print("URLError occurred: \(error)")
    //            } else {
    //                print("Unknown error: \(String(describing: response.result.error))")
    //            }
}

