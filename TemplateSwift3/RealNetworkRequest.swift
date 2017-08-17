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
    
    func request(router: URLRequestConvertible, completion: @escaping (Result<Json>) -> Void) {
        
        sessionManager.request(router).responseJSON(completionHandler: { (response) in
            if let value = response.result.value, let result = Json(json: value) {
                completion(.success(result))
            } else {
                completion(.error)
            }
        })
    }
    
    func request(_ url: URL, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?, completion: @escaping (Result<Json>) -> Void) {
        
        sessionManager.request(url,
                               method: method,
                               parameters: parameters,
                               encoding: URLEncoding.default,
                               headers: headers).responseJSON(completionHandler: { (response) in
                               
                                if let value = response.result.value, let result = Json(json: value) {
                                    completion(.success(result))
                                } else {
                                    completion(.error)
                                }
                               
                               })
    }
    
}
