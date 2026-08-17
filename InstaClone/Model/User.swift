//
//  User.swift
//  InstaClone
//
//  Created by beri on 4.08.2026.
//
import FirebaseAuth
import Firebase
import Foundation
struct User: Identifiable,Hashable, Codable{
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    var isCurrentUser: Bool{
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return false
        }
        return currentUid == id
    }

}
extension User{
    static var MOCK_USER: [User] = [
        .init(id: UUID().uuidString, username: "monkey1", profileImageUrl: "1", fullname: "Monkey 1", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", email: "monkey1@gmail.com"),
        .init(id: UUID().uuidString, username: "monkey1", profileImageUrl: "2", fullname: "Monkey 2", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", email: "monkey2@gmail.com"),
        .init(id: UUID().uuidString, username: "monkey1", profileImageUrl: "3", fullname: "Monkey 3", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", email: "monkey3@gmail.com"),
        .init(id: UUID().uuidString, username: "monkey1", profileImageUrl: "4", fullname: "Monkey 4", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", email: "monkey4@gmail.com"),.
        init(id: UUID().uuidString, username: "monkey1", profileImageUrl: "5", fullname: "Monkey 5", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", email: "monkey5@gmail.com"),
    ]
}
