//
//  JsonParser.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 17/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Alamofire

protocol JsonParser {
    func parseResponseServer(response: DataResponse<Any>, completion: @escaping (Result<Json>) -> Void)
}
