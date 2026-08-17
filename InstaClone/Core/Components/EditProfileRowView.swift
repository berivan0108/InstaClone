//
//  EditProfileRowView.swift
//  InstaClone
//
//  Created by beri on 17.08.2026.
//

import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack{
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment:  .leading)
            VStack{
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        
        .font(.subheadline)
        .frame(height: 36)


    }
}

#Preview {
    EditProfileRowView(title: "Fullname", placeholder: "Fullname", text: .constant("Abone ol"))
}
