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
            
            
//            if let error = response.error, let data = response.data, let err = NetworkError(error: NSError.basic(error, body: data), data: data) {
//                completion(.error(err))
//            }
            
            if let error = response.result.error as? AFError {
//                statusCode = error._code // statusCode private
                switch error {
                case .invalidURL(let url):
                    print("Invalid URL: \(url) - \(error.localizedDescription)")
                case .parameterEncodingFailed(let reason):
                    print("Parameter encoding failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                case .multipartEncodingFailed(let reason):
                    print("Multipart encoding failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                case .responseValidationFailed(let reason):
                    print("Response validation failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    
                    switch reason {
                    case .dataFileNil, .dataFileReadFailed:
                        print("Downloaded file could not be read")
                    case .missingContentType(let acceptableContentTypes):
                        print("Content Type Missing: \(acceptableContentTypes)")
                    case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                        print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                    case .unacceptableStatusCode(let code):
                        print("Response status code was unacceptable: \(code)")
//                        statusCode = code
                    }
                case .responseSerializationFailed(let reason):
                    print("Response serialization failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    // statusCode = 3840 ???? maybe..
                }
                
                print("Underlying error: \(String(describing: error.underlyingError))")
            } else if let error = response.result.error as? URLError {
                print("URLError occurred: \(error)")
            } else {
                print("Unknown error: \(String(describing: response.result.error))")
            }
            
            
        }
    }
    
}
