//
//  CreatePassowordView.swift
//  InstaClone
//
//  Created by beri on 8.07.2026.
//

import SwiftUI

struct CreatePassowordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : RegisterViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Spacer()
                Text("Add your password")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                 
                Text("You will use this password to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                 
                SecureField("Password", text: $viewModel.password)
                    .autocapitalization(.none)
                    .modifier(IGTextFieldViewModifier())
                 
                NavigationLink {
                    CompleteSignUpView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color(.systemBlue))
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
        .environmentObject(RegisterViewModel())
}
