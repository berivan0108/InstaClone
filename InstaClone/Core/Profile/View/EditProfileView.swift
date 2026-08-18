//
//  EditProfileView.swift
//  InstaClone
//
//  Created by beri on 17.08.2026.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @StateObject var viewModel : EditProfileViewModel
    
    init(user: User){
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
        
    }
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            // 1. Üst Navbar Kısmı
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                
                Spacer()
                
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button("Done") {
                    Task { try await viewModel.uploadUserData() }
                    // Kaydetme işlemleri buraya gelecek
                }
                .font(.subheadline)
                .fontWeight(.bold)
            }
            .padding()
            
            Divider()
            
            // 2. Profil Fotoğrafı Seçme Kısmı
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .foregroundStyle(.gray)
                            .frame(width: 80, height: 80)
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical, 8)
            
            Divider()
            
            // 3. Bilgi Giriş Alanları (Name & Bio)
            VStack(spacing: 16) {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USER[0])
}
