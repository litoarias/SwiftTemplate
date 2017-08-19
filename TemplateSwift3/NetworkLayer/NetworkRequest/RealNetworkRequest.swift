//
//  RealNetworkRequest.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 17/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Alamofire

class RealNetworkRequest: NetworkRequest, JsonParser {
    
    var sessionManager: NetworkSessionManager
    
    init(sessionManager: NetworkSessionManager) {
        self.sessionManager = sessionManager
    }
    
    func request(router: URLRequestConvertible, completion: @escaping (Result<Json, NetworkError>) -> Void) {
        self.request(router: router, adapter: nil, completion: completion)
    }
    
    func request(router: URLRequestConvertible, adapter: RequestAdapter?, completion: @escaping (Result<Json, NetworkError>) -> Void) {
        
        sessionManager.adapter = adapter
        sessionManager.sessionManager
            .request(router)
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: { [weak self] (response) in
                self?.parseResponseServer(response: response, completion: completion)
            })
    }
    
    func request(_ url: URL, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?, completion: @escaping (Result<Json, NetworkError>) -> Void) {
        
        sessionManager.sessionManager
            .request(url,
                     method: method,
                     parameters: parameters,
                     encoding: URLEncoding.default,
                     headers: headers)
            .responseJSON(completionHandler: { [weak self] (response) in
                self?.parseResponseServer(response: response, completion: completion)
            })
    }
    
}
