//
//  LogInViewModel.swift
//  Education
//
//  Created by Shanim on 31/03/23.
//

import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    var isValid: Bool {
        isValidEmail(email) && isValidPassword(password)
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
}
