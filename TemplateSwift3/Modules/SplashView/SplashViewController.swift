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
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension SplashViewController: SplashView {
    // TODO: implement view output methods
}
