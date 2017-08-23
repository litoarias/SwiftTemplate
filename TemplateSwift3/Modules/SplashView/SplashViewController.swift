//
//  SplashViewController.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import ObjectMapper

class SplashViewController: BaseViewController, StoryboardLoadable {
    
    // MARK: Properties
    
    var presenter: SplashPresentation?
    var networkService: RealNetworkRequest = RealNetworkRequest(sessionManager: NetworkSessionManager.shared)
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        networkService.request(router: DemoRouter.postsA()) { (result) in
//            
//            switch result {
//                
//            case .success(.array (let response)):
//                if let resp = Mapper<PostDemoModel>().mapArray(JSONArray: response){
//                    debugPrint("--> \(resp)")
//                }
//                
//            case .success(.object (let response)):
//                if let resp = Mapper<PostDemoModel>().map(JSON: response) {
//                    debugPrint("----> \(resp)")
//                }
//                
//                
//            case .error(.basicError (let error)):
//                debugPrint(error)
//                
//            case .error(.timeoutError (let error)), .error(.noInternet (let error)):
//                debugPrint(error)
//                
//                
//            }
//        }
    }
}

extension SplashViewController: SplashView {
    // TODO: implement view output methods
}
