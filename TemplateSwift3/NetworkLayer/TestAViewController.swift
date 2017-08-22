//
//  TestAViewController.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 21/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

class TestAViewController: UIViewController {

    lazy var viewManager: TestAViewManager = TestAViewManager(parentViewController: self)
    lazy var logicManager: TestALogicManager = {return TestALogicManager()}()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewManager.view
        viewManager.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewManager.viewDidAppear(animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewManager.viewWillDisappear(animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
