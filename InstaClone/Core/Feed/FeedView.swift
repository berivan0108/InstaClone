//
//  FeedView.swift
//  InstaClone
//
//  Created by beri on 7.07.2026.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(0...10, id: \.self) { post in
                        FeedCell()
                        
                        
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Image("instaclone")
                        .resizable()
                        .frame(width: 100, height: 32)
                    
                    
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }         }
        }
    }
}

#Preview {
    FeedView()
}
