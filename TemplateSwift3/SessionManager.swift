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
    
    
    func request(params: URLRequestConvertible, completion:@escaping (_ result: String?,_ error: NSError?) -> Void) {
        
        sessionManager
            .request(params)
            .debugLog()
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                #if DEBUG || DEV
                    print("Response:\n")
                    debugPrint(response)
                    print("\n")
                #endif
                
                switch response.result {
                    
                case .success:
                    guard let data = response.data, let json = String(data: data, encoding: String.Encoding.utf8) else {
                        completion(nil, NSError.parseError())
                        return
                    }
                    completion(json, nil)
                    
                case .failure(let error):
                    completion(nil, NSError(domain:error._domain, code:error._code, userInfo:error._userInfo as! [AnyHashable : Any]?))
                    
                }
                
        }
        
    }
    
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


