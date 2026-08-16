import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegisterViewModel

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Text("Welcome to Insta, \(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Click below to complete registration and start using Insta")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            if !viewModel.errorMessage.isEmpty{
                Text(viewModel.errorMessage)
                    .foregroundStyle(.red)
            }
            Button {
                Task {try await viewModel.createUser()}
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
            .environmentObject(RegisterViewModel())

    }
}
