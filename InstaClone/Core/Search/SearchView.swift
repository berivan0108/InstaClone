//
//  SearchView.swift
//  InstaClone
//
//  Created by beri on 7.07.2026.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
    NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(User.MOCK_USER){ user in
                        
                        NavigationLink(value: user) {
                            HStack{
                                Image(user.profileImageUrl ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .tint(Color.primary)
                                VStack(alignment: .leading){
                                    Text(user.username)
                                        .tint(Color.primary)
                                        .fontWeight(.semibold)
                                    if let fullname =
                                        user.fullname{
                                        Text(fullname )
                                            .tint(Color.primary)
                                    }
                                    
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                }
                .searchable(text: $searchText, prompt: "Search...")
            }
        
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
                
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
