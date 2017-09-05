//
//  SplashInteractor.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation
import ObjectMapper

class SplashInteractor {

    // MARK: Properties

    weak var output: SplashInteractorOutput?
    var network: Network! = nil
    
}

extension SplashInteractor: SplashUseCase {
    // TODO: Implement use case methods    
    
    func getPosts() {
        network.request(router: DemoRouter.postsA(), adapter: DemoAdapter()) { [weak self] (result) in
            switch result {
                
            case .success(.array (let response)):
                self?.output?.collectionRecieve(response)
                // Manage objects to Local Storage or similar task
                if let resp = Mapper<PostDemoModel>().mapArray(JSONArray: response){
                    debugPrint("Collection: ----> \(resp)")
                }
                break
                
            case .success(.object (let response)):
                self?.output?.objectReceive(response)
                // Manage objects to Local Storage or similar task
                if let resp = Mapper<PostDemoModel>().map(JSON: response) {
                    debugPrint("Single: ----> \(resp)")
                }
                break
                
            case .error(.basic (let error)):
                self?.output?.errorReceive((error.0, error.1))
                debugPrint("Error: \(error)")
                
                break
                
            }
        }
    }
    
}
