//
//  DemoRouter.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 2/8/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Alamofire

enum DemoRouter: URLRequestConvertible {
    
    case postsA()
    case postsB()
    case postsC(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .postsA:
            return .get
        case .postsB:
            return .post
        case .postsC:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .postsA:
            return Constants.URL.posts_verbGet
        case .postsB:
            return Constants.URL.posts_verbPost
        case .postsC:
            return Constants.URL.posts_verbGetWithParams
            
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.URL.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .postsC(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .postsA(), .postsB():
            break
            
        }
        return urlRequest
    }
    
}
