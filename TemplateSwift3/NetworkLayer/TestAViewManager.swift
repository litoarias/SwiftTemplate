//
//  TestAViewManager.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 21/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation
import UIKit

// View and subview related stuffs should be written here.
class TestAViewManager: NSObject {

    @IBOutlet var view: UIView!

    weak var viewController: TestAViewController?

    override init() {
        super.init()
        Bundle.main.loadNibNamed("TestAViewManager", owner: self, options: nil)
    }

    convenience init(parentViewController: TestAViewController) {
        self.init()
        self.viewController = parentViewController
    }

    func viewDidLoad() {
    }

    func viewDidAppear(animated: Bool) {
    }

    func viewWillDisappear(animated: Bool) {
    }

}
