//
//  SplashPresenter.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

class SplashPresenter {

    // MARK: Properties

    weak var view: SplashView?
    var router: SplashWireframe?
    var interactor: SplashUseCase?
}

extension SplashPresenter: SplashPresentation {
    // TODO: implement presentation methods
}

extension SplashPresenter: SplashInteractorOutput {
    // TODO: implement interactor output methods
}
