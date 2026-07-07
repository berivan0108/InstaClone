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
                    ForEach(0...20, id: \.self){ user in
                        
                        HStack{
                            Image("ben")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .tint(Color.primary)
                            VStack(alignment: .leading){
                                Text("berivandagci")
                                    .tint(Color.primary)
                                    .fontWeight(.semibold)
                                Text("Berivan Dağcı")
                                    .tint(Color.primary)
                                
                            }
                            .font(.footnote)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    
                }
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
