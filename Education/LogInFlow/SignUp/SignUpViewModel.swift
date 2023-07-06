//
//  SignUpViewModel.swift
//  Education
//
//  Created by Shanim on 31/03/23.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage = ""
    
    var isValid: Bool {
        isValidEmail(email) && isValidPassword(password) && isValidConfirmPassword(confirmPassword)
    }
    
    func validateFields() {
        
        if !isValidEmail(email) {
            if email == "" {
                errorMessage = "Please enter an email"
            } else {
                errorMessage = "Please enter a valid email address"
            }
        } else if !isValidPassword(password) {
            if password == "" {
                errorMessage = "Please enter password"
            } else {
                errorMessage = "Password must be at least 8 characters long"
            }
        } else if !isValidConfirmPassword(confirmPassword) {
            if confirmPassword == "" {
                errorMessage = "Please match password"
            } else {
                errorMessage = "Password should be same"
            }
        } else {
            errorMessage = ""
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        return password.count >= 8
    }
    
    func isValidConfirmPassword(_ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
}
