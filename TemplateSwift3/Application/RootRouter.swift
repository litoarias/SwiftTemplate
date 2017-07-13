//
//  RootRouter.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

class RootRouter: NSObject {
    
    func presentFirstScreen(inWindow window: UIWindow) {
        presentMainSearchScreen()
    }
    
    private func presentMainSearchScreen() {
        let mainSearchViewController = SplashRouter.setupModule()
        presentView(mainSearchViewController)
    }
    
    private func presentView(_ viewController: UIViewController) {
        guard let window = UIApplication.shared.delegate?.window! else { return }
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        window.rootViewController = viewController
    }
}
