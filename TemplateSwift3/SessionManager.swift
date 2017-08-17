//
//  SessionManager.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//


import Alamofire

class NetworkSessionManager: SessionManager {
    
    static let shared : NetworkSessionManager = {
        let instance = NetworkSessionManager()
        return instance
    }()
    
    var sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 30
        
        return SessionManager(configuration: configuration)
    }()
    
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG || DEV
            print("Request:\n")
            debugPrint(self)
            print("\n")
        #endif
        return self
    }
}


