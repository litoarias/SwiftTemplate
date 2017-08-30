//
//  SplashContract.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

protocol SplashView: BaseView {
    // TODO: Declare view methods
}

protocol SplashPresentation: class {
    // TODO: Declare presentation methods
    func viewDidLoad()
}

protocol SplashUseCase: class {
    // TODO: Declare use case methods
    func getPosts()
}

protocol SplashInteractorOutput: class {
    // TODO: Declare interactor output methods
    func objectReceive(_ object: [String : Any])
    func collectionRecieve(_ collection: [[String : Any]])
    func errorReceive(_ error: (NSError, Data?))
}

protocol SplashWireframe: class {
    // TODO: Declare wireframe methods
}
