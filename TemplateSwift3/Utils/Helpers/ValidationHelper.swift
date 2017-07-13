//
//  ValidationHelper.swift
//  TemplateSwift3
//
//  Created by Hipolito Arias on 13/07/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

struct ValidationHelper {
        
        static func isUserValid(_ testUser: String?) -> Bool {
            guard let user = testUser else { return false }
            return user.isValidUser
        }
        
        static func isNameValid(_ testName: String?) -> Bool {
            guard let name = testName else { return false }
            return name.isValidName
        }
        
        static func isPasswordValid(_ testPassword: String?) -> Bool {
            guard let password = testPassword else { return false }
            return password.characters.count >= 6
        }
        
        static func isPhoneValid(_ testPhone: String?) -> Bool {
            guard let phone = testPhone else { return false }
            return phone.isValidPhone
        }
        
        static func isEmailValid(_ testEmail: String?) -> Bool {
            guard let email = testEmail else { return false }
            return email.isValidEmail
        }
        
        static func isCompanyValid(_ testCompany: String?) -> Bool {
            guard let company = testCompany else { return false }
            return !company.isEmpty
        }
        
        static func isCnpjValid(_ testCnpj: String?) -> Bool {
            guard let cnpj = testCnpj else { return false }
            return cnpj.isValidCNPJ
        }
        
        static func isCpfValid(_ testCpf: String?) -> Bool {
            guard let cpf = testCpf else { return false }
            return cpf.isValidCPF
        }
        
        static func isBankValid(_ testBank: String?) -> Bool {
            guard let bank = testBank else { return false }
            return bank.isValidBank
        }
        
        static func isAgencyValid(_ testAgency: String?) -> Bool {
            guard let agency = testAgency else { return false }
            return agency.isValidAgency
        }
        
        static func isAccountValid(_ testAccount: String?) -> Bool {
            guard let account = testAccount else { return false }
            return account.isValidAccount
        }
        
    
}
