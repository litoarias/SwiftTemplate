//
//  AuthRouter.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 14/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Alamofire

enum AuthRouter: URLRequestConvertible {
    
    case login(parameters: Parameters)
    case changePassword(parameters: Parameters)
    case resetPassword(parameters: Parameters)
    case registerDevice(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .changePassword:
            return .post
        case .resetPassword:
            return .post
        case .registerDevice:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return Constants.URL.login
        case .changePassword:
            return Constants.URL.changePassword
        case .resetPassword:
            return Constants.URL.resetPassword
        case .registerDevice:
            return Constants.URL.registerDevice
            
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try makeurlRequest()
        switch self {
        case .login(let parameters), .changePassword(let parameters), .resetPassword(let parameters), .registerDevice(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
    
    func makeurlRequest() throws -> URLRequest {
        let url = try Constants.URL.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
