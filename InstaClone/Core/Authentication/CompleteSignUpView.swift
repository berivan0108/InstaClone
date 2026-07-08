import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Text("Welcome to Insta, berivandagci")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Click below to complete registration and start using Insta")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            // Burası bir işlem sayfası olduğu için NavigationLink değil Button kullanmalısın
            Button {
                // Main
                print("COMPLETE")
            } label: {
                Text("Complete sign up")
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
        // Toolbar'ı NavigationStack içinde değil, View'ın kendisine eklemelisin
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

#Preview {
    NavigationStack { // Preview'da görebilmek için buraya ekledik
        CompleteSignUpView()
    }
}
