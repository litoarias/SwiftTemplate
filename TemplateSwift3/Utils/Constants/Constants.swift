//
//  Constants.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit
import Foundation
import Localize_Swift

enum Constants {
    
    enum URL {
        static let baseURL = "https://jsonplaceholder.typicode.com/"
        static let posts_verbGet = "psdfasdosts"
        static let posts_verbPost = "posts"
        static let posts_verbGetWithParams = "posts"
    }
    
    enum Storyboard {
        static let mainSearchStoryboard = "MainSearchStoryboard"
    }
    
    enum ViewControllerIdentifier {
        static let mainSearchViewControllerIdentifier = "MainSearchViewControllerID"
    }
    
    enum Label {
        static let padding = CGFloat(10)
        static let edgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
    }
    
    enum Font {
        static let SFTextLight = "SanFranciscoText-Light"
        static let SFTextMedium = "SanFranciscoText-Medium"
        static let SFTextRegular = "SanFranciscoText-Regular"
    }
    
    enum Keychain {
        static let keychainId = "com.iecisa.project"
        static let password = "auth_password"
        static let identifier = "auth_identifier"
        static let token = "auth_token"
        static let firebaseToken = "firebase_token"
    }
}
