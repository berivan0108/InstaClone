//
//  EditProfileViewModel.swift
//  InstaClone
//
//  Created by beri on 17.08.2026.
//

import Photos
import Foundation
import PhotosUI
import Firebase
import _PhotosUI_SwiftUI
import SwiftUICore

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    private var uiImage : UIImage?
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
    
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func uploadUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            if let imageUrl = try await ImageUploader.uploadImage(uiImage) {
                data["profileImageUrl"] = imageUrl
            }
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
