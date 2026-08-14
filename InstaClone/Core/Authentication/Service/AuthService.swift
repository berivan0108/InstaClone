//
//  AuthService.swift
//  InstaClone
//
//  Created by beri on 14.08.2026.
//

import FirebaseAuth
import Foundation

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {}
    
    func createUser(email: String, password: String, username: String) async throws {}
    
    func loadUserData() async throws {}
    
    func sigout() {}
}
