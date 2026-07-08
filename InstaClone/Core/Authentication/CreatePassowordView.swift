//
//  CreatePassowordView.swift
//  InstaClone
//
//  Created by beri on 8.07.2026.
//

import SwiftUI

struct CreatePassowordView: View {
    @State private var password = ""
    @Environment(\.dismiss) var dismiss


    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Spacer()
                Text("Add your password")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("You will use this email to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                TextField("Password", text: $password)
                    .autocapitalization(.none)
                    .modifier(IGTextFieldViewModifier())
                
                Button {
                  CompleteSignUpView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Next") // Kayıt ekranında "Next" daha mantıklı
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white) // Beyaz yazı
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color(.systemBlue)) // Mavi arka plan
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .padding(.top, 12)
                }
                
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }                }
            }
        }
    }
}


#Preview {
    CreatePassowordView()
}
