//
//  Result.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 17/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(NSError, Data)
}
