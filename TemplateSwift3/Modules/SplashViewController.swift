//
//  SplashViewController.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: SplashPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*DemoProvider().getPosts(success: { (data) in
            
        }) { (error) in
        
        }*/
        
        let params = ["userId" : "1"]
        DemoProvider().getPosts(params: params, success: { (data) in
            
        }) { (error) in
            
        }
    }
}

extension SplashViewController: SplashView {
    // TODO: implement view output methods
}
