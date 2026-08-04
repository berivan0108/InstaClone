//
//  FeedCell.swift
//  InstaClone
//
//  Created by beri on 7.07.2026.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            // Profil foto ve kullanıcı adı
            HStack {
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post görseli
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipped()
                .tint(Color.primary)
            
            // Action butonları
            HStack(spacing: 16) {
                Button {} label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button {} label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button {} label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .tint(Color.primary)
            
            // Beğeni sayısı (Boşluk eklendi)
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // Açıklama
            HStack {
                Text(post.user?.username ?? "berivandagci").fontWeight(.semibold) +
                Text(" \(post.caption)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            // Zaman
            Text("10h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POST[0])
}
