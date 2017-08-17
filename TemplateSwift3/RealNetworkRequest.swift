//
//  RealNetworkRequest.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 17/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Alamofire

class RealNetworkRequest: NetworkRequest {
    
    var sessionManager = NetworkSessionManager.shared.sessionManager
    var jsonParser = ResponseJsonParser()
    
    //    var sessionManager: NetworkSessionManager
    //    var jsonParser: ResponseJsonParser
    //    init(sessionManager: NetworkSessionManager, jsonParser: ResponseJsonParser) {
    //        self.sessionManager = sessionManager
    //        self.jsonParser = jsonParser
    //    }    
    
    func request(router: URLRequestConvertible, completion: @escaping (Result<Json>) -> Void) {
        self.request(router: router, adapter: nil, completion: completion)
    }
    
    func request(router: URLRequestConvertible, adapter: RequestAdapter?, completion: @escaping (Result<Json>) -> Void) {
        
        sessionManager.adapter = adapter
        sessionManager
            .request(router)
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: { [weak self] (response) in
                self?.jsonParser.parseResponseServer(response: response, completion: completion)
            })
    }
    
    func request(_ url: URL, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?, completion: @escaping (Result<Json>) -> Void) {
        
        sessionManager
            .request(url,
                     method: method,
                     parameters: parameters,
                     encoding: URLEncoding.default,
                     headers: headers)
            .responseJSON(completionHandler: { [weak self] (response) in
                self?.jsonParser.parseResponseServer(response: response, completion: completion)
            })
    }
    
}
