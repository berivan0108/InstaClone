//
//  RegisterViewModel.swift
//  InstaClone
//
//  Created by beri on 15.08.2026.
//

import Foundation

class RegisterViewModel: ObservableObject{
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    func createUser() async throws{
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
    
}
