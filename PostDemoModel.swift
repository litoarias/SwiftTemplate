//
//	PostDemoModel.swift
//
//	Create by Hipolito Arias on 2/8/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class PostDemoModel : NSObject, NSCoding, Mappable{

	var body : String?
	var id : Int?
	var title : String?
	var userId : Int?


	class func newInstance(map: Map) -> Mappable?{
		return PostDemoModel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		body <- map["body"]
		id <- map["id"]
		title <- map["title"]
		userId <- map["userId"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         body = aDecoder.decodeObject(forKey: "body") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         title = aDecoder.decodeObject(forKey: "title") as? String
         userId = aDecoder.decodeObject(forKey: "userId") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if body != nil{
			aCoder.encode(body, forKey: "body")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "userId")
		}

	}

}