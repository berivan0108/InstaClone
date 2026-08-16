//
//  UserService.swift
//  InstaClone
//
//  Created by beri on 16.08.2026.
//

import Firebase
import Foundation
import FirebaseFirestore

struct UserService {
    func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
}
