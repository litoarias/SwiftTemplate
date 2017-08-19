//
//  SplashRouter.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation
import UIKit

class SplashRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> SplashViewController {
        let viewController = UIStoryboard.loadViewController() as SplashViewController
        let presenter = SplashPresenter()
        let router = SplashRouter()
        let interactor = SplashInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension SplashRouter: SplashWireframe {
    // TODO: Implement wireframe methods
}
