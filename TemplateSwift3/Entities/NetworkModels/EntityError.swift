//
//  EntityError.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 19/8/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import ObjectMapper

struct EntityError : Mappable {
    
    var message : String?
    var statusCode : Int?
    
    init?(map: Map){}
    
    mutating func mapping(map: Map) {
        message <- map["message"]
        statusCode <- map["statusCode"]
    }
    
}

extension EntityError {
    static func mapping(body: String) -> EntityError? {
        if let model =  Mapper<EntityError>().map(JSONString: body) {
            return model
        }
        return nil
    }
    
    func isNil() -> Bool {
        if self.message == nil { return true }
        if self.statusCode == nil { return true }
        return false
    }
}
