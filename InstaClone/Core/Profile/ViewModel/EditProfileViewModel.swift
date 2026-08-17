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
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    @Published var fullname = "" // @State yerine @Published yapıldı
    @Published var bio = ""      // @State yerine @Published yapıldı
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
} 
