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
        
        networkService.request(router: DemoRouter.postsA(), adapter: DemoAdapter()) { (result) in
            
            switch result {
                
            case .success(.array (let response)):
                if let resp = Mapper<PostDemoModel>().mapArray(JSONArray: response){
                    debugPrint("--> \(resp)")
                }
                
            case .success(.object (let response)):
                if let resp = Mapper<PostDemoModel>().map(JSON: response) {
                    debugPrint("----> \(resp)")
                }
                
                
            case .error(.basicError (let error)):
                debugPrint(error)
                print(error.0.userInfo["description"] ?? "No description")
                print(error.0.userInfo["message"] ?? "No message")
         
            }
        }
    }
}

extension SplashViewController: SplashView {
    // TODO: implement view output methods
}
