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
    var network: Network = Network(session: NetworkSessionManager.shared)
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        call(nil)
        
        
    }
    
    @IBAction func call(_ sender: Any?) {
        
        network.request(router: DemoRouter.postsA(), adapter: DemoAdapter()) { (result) in
            
            switch result {
                
            case .success(.array (let response)):
                if let resp = Mapper<PostDemoModel>().mapArray(JSONArray: response){
                    debugPrint("Collection: ----> \(resp)")
                }
                break
                
            case .success(.object (let response)):
                if let resp = Mapper<PostDemoModel>().map(JSON: response) {
                    debugPrint("Single: ----> \(resp)")
                }
                break
                
            case .error(.basic (let error)):
                debugPrint("Error: \(error)")
                break
                
            }
        }
        
    }
}

extension SplashViewController: SplashView {
    // TODO: implement view output methods
}
