import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        // NavigationStack en dışta olmalı.
        // Eğer bu sayfa başka bir NavigationStack'ten çağrılıyorsa buradaki NavigationStack'i silebilirsin.
        NavigationStack {
            VStack(spacing: 12) {
                Spacer()
                
                Text("Add your email")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("You will use this email to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .modifier(IGTextFieldViewModifier())
                
                // NavigationLink düzeltildi
                NavigationLink {
                    CreateUserNameView()
                    
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    AddEmailView()
}
