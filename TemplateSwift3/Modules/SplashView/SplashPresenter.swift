//
//  SplashPresenter.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation
import ObjectMapper

class SplashPresenter {

    // MARK: Properties

    weak var view: SplashView?
    var router: SplashWireframe?
    var interactor: SplashUseCase?
}

extension SplashPresenter: SplashPresentation {
    func viewDidLoad() {
        interactor?.getPosts()
    }

    // TODO: implement presentation methods
    

}

extension SplashPresenter: SplashInteractorOutput {
    
    // TODO: implement interactor output methods

    func objectReceive(_ object: [String : Any]) {
        if let resp = Mapper<PostDemoModel>().map(JSON: object) {
            debugPrint("Single: ----> \(resp)")
        }
    }

    func collectionRecieve(_ collection: [[String : Any]]) {
        if let resp = Mapper<PostDemoModel>().mapArray(JSONArray: collection){
            debugPrint("Collection: ----> \(resp)")
        }
    }
    
    func errorReceive(_ error: (NSError, Data?)) {
        
    }
}
