//
//  CurremtUserProfileView.swift
//  InstaClone
//
//  Created by beri on 4.08.2026.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    
    var body: some View {
        ProfileView(user: user)
    }
    
    struct ProfileView: View {
        private let gridItems: [GridItem] = [
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1)
        ]
        
        let user: User
        
        var posts: [Post] {
            return Post.MOCK_POST.filter({ $0.user?.username == user.username })
        }
        
        var body: some View {
            NavigationStack {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        // 1. Üst Kısım (Dinamikleştirildi)
                        HStack {
                            Image(user.profileImageUrl ?? "")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Spacer()
                            
                            HStack(spacing: 8) {
                                UserStatView(value: 10, title: "Post")
                                UserStatView(value: 10, title: "Followers")
                                UserStatView(value: 10, title: "Following")
                            }
                        }
                        .padding(.horizontal)
                        
                        // 2. İsim ve Biyo (Dinamikleştirildi)
                        VStack(alignment: .leading, spacing: 4) {
                            if let fullname = user.fullname {
                                Text(fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            if let bio = user.bio {
                                Text(bio)
                                    .font(.footnote)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        // 3. Buton
                        Button {} label: {
                            Text("Edit Profil")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 360, height: 32)
                                .foregroundStyle(Color.primary)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.primary.opacity(0.4), lineWidth: 1)
                                )
                        }
                        
                        Divider()
                        
                        // 4. Izgara (Grid)
                        PostGridView(posts: posts)
                    }
                    .padding(.top)
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {} label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(Color.primary)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USER[0])
}
