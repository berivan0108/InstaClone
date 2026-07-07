//
//  FeedCell.swift
//  InstaClone
//
//  Created by beri on 7.07.2026.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            
            // profil foto
            HStack{
                Image("ben")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 40)
                    .clipShape(Circle())
                Text("berivandagci")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
                
                
            }
            .padding(.leading, 8)
            // post görseli
            Image("ben")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
                .tint(Color.primary)
            
             // action butonları
            HStack{
                Button{
                    
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button{
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button{
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .tint(Color.primary)

            // beğeni sayısı ve like
            
            Text("12 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading) // Hatalar burada düzeltildi                .padding(.leading, 10)
                .padding(.top, 1)
                .padding(.leading, 10)
            
            
            
            // açıklama
            HStack{
                Text("berivandagci").fontWeight(.semibold) +
                Text("merhaba ben beri_os")
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
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
    FeedCell()
}
