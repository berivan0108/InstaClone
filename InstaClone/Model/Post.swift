//
//  Post.swift
//  InstaClone
//
//  Created by beri on 4.08.2026.
//

import Foundation


struct Post: Identifiable, Hashable, Codable {
let id: String
let ownerUid: String
let caption: String
var likes: Int
let imageUrl: String
let timestamp: Date
var user: User?
}
extension Post {
    static var MOCK_POST: [Post] = [
        .init(id: UUID().uuidString , ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", likes:124, imageUrl: "1", timestamp: Date(), user: User.MOCK_USER[0]),
        .init(id: UUID().uuidString , ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", likes:125, imageUrl: "2", timestamp: Date(), user: User.MOCK_USER[1]),
        .init(id: UUID().uuidString , ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", likes:14, imageUrl: "3", timestamp: Date(), user: User.MOCK_USER[2]), .init(id: UUID().uuidString , ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", likes:24, imageUrl: "4", timestamp: Date(), user: User.MOCK_USER[3]),
        .init(id: UUID().uuidString , ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", likes:12, imageUrl: "5", timestamp: Date(), user: User.MOCK_USER[4]),
    ]
}
