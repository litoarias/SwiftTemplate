//
//  DemoProvider.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 2/8/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Alamofire
import ObjectMapper

class DemoProvider {
    
//    let manager = NetworkSessionManager.shared
//    
//    func getPosts(success:@escaping (Array<PostDemoModel>) -> Void,
//                  failure:@escaping (NSError) -> Void) {
//        
//        manager.request(params: DemoRouter.postsA()) { response in
//            
//            if(response.1 == nil) {
//                guard let resp = response.0 else {
//                    failure(NSError.parseError())
//                    return
//                }
//                if let response = Mapper<PostDemoModel>().mapArray(JSONString: resp) {
//                    success(response)
//                }
//            } else {
//                failure(response.1!)
//            }
//        }
//    }
//    
//    func getPosts(params: Parameters,
//                  success:@escaping (Array<PostDemoModel>) -> Void,
//                  failure:@escaping (NSError) -> Void) {
//        
//        manager.request(params: DemoRouter.postsC(parameters: params)) { response in
//            
//            if(response.1 == nil) {
//                guard let resp = response.0 else {
//                    failure(NSError.parseError())
//                    return
//                }
//                if let response = Mapper<PostDemoModel>().mapArray(JSONString: resp) {
//                    success(response)
//                }
//            } else {
//                failure(response.1!)
//            }
//        }
//    }
    
}
