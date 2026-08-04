//
//  ProfileHeaderView.swift
//  InstaClone
//
//  Created by beri on 4.08.2026.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    var body: some View {
        VStack(spacing: 20) {
            // 1. Üst Kısım
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
            
            // 2. İsim ve Biyo
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
        } // <-- VStack'in kapanış parantezi buraya eklendi
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER[0])
}
