//
//  BaseContract.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

protocol BaseView: class {
    func showLoading()
    func hideLoading()
    func showError(_ message: String?)
    func showMessage(_ message: String?, withTitle title: String?)
}
