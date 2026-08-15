//
//  LoginViewModel.swift
//  InstaClone
//
//  Created by beri on 15.08.2026.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws { 
        try await AuthService.shared.login(withEmail: email, password: password) // Parantez eklendi
    }
}
