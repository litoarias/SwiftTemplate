//
//  SessionHelper.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation
import KeychainAccess

enum KeychainCore {
    
    static let keychain = Keychain(service: Constants.Keychain.keychainId)
    
    // MARK: Setters
    
    static func setPassword(password: String) {
        do {
            try keychain.set(password, key: Constants.Keychain.password)
            print("--->>> \(KeychainCore.getPassword()) <<<----")
        }
        catch let error {
            print("setPassword Keychain error save: \(error)")
        }
    }
    
    static func setIdentifier(NIF: String) {
        do {
            try keychain.set(NIF, key: Constants.Keychain.identifier)
            print("--->>> \(KeychainCore.getIdentifier()) <<<----")
        }
        catch let error {
            print("setUserIdentifier Keychain error save: \(error)")
        }
    }
    
    
    static func setToken(token: String) {
        do {
            try keychain.set(token, key: Constants.Keychain.token)
            
            print("--->>> \(KeychainCore.getToken()) <<<----")
        }
        catch let error {
            print("setUserToken Keychain error save: \(error)")
        }
    }
    
    
    // MARK: Getters
    
    static func getPassword() -> String {
        let password = keychain[string: Constants.Keychain.password]
        guard password != nil else {
            return ""
        }
        return password!
    }
    
    static func getIdentifier() -> String {
        let identifier = keychain[string: Constants.Keychain.identifier]
        guard identifier != nil else {
            return ""
        }
        return identifier!
    }
    
    static func getToken() -> String {
        let token = keychain[string: Constants.Keychain.token]
        guard token != nil else {
            return ""
        }
        return token!
    }
    
    
    static func deleteAll() {
        do {
            try keychain.remove(Constants.Keychain.identifier)
            try keychain.remove(Constants.Keychain.password)
            try keychain.remove(Constants.Keychain.token)
        } catch let error {
            print("error: \(error)")
        }
        
    }
}
