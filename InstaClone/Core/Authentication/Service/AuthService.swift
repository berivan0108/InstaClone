//
//  AuthService.swift
//  InstaClone
//
//  Created by beri on 14.08.2026.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation
import Firebase
import FirebaseFirestoreCombineSwift
class AuthService: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("Failed to log in with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("Kayıt hatası: \(error.localizedDescription)")
            throw error
        }
    }
    func uploadUserData (uid: String, username: String, email:String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else
        {
            return
        }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        
    }
    func loadUserData() async throws {}
    
    func sigout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
