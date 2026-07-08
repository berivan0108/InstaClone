import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Logo
                Image("instaclone")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                // Giriş Alanları
                VStack(spacing: 12) {
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldViewModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(IGTextFieldViewModifier())

                }
                
                // Login Butonu
                Button { print("LOGIN BUTTON") } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.primary)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        .padding(.horizontal, 24)
                        .padding(.top, 12)
                }
                
                // Forget Password
                Button { print("FORGET PASSWORD") } label: {
                    Text("Forget Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                // OR Çizgisi
                HStack {
                    Rectangle().frame(height: 0.5).foregroundStyle(.gray)
                    Text("OR").font(.footnote).fontWeight(.semibold).foregroundStyle(.gray)
                    Rectangle().frame(height: 0.5).foregroundStyle(.gray)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                
                // Facebook Girişi
                HStack {
                    Image("facebook") // "facebook" adında bir asset'in olduğundan emin ol
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Facebook")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                
                // Sign Up
                Divider()
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                    Text("Sign up view") // Buraya asıl kayıt sayfasını bağlayacağız
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign up").fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
