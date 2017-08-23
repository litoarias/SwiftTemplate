//
//  JsonParser.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 17/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Alamofire

protocol JsonParser {
    func parseResponseServer(response: DataResponse<Any>, completion: @escaping (Result<Json, NetworkError>) -> Void)
}

extension JsonParser where Self: RealNetworkRequest {
    
    func parseResponseServer(response: DataResponse<Any>, completion: @escaping (Result<Json, NetworkError>) -> Void) {
        if let value = response.result.value, let result = Json(json: value) {
            completion(.success(result))
        } else {
            if let error = response.error, let data = response.data, let err = NetworkError(error: NSError.basic(error, body: data), data: data) {
                completion(.error(err))
            }
        }
    }
    
}
