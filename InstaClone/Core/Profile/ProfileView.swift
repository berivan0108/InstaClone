import SwiftUI

struct ProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        // En dışta sadece NavigationStack
        NavigationStack {
            // ScrollView'ı burada doğrudan kullanıyoruz
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 20) {
                    // 1. Üst Kısım
                    HStack {
                        Image("ben")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            UserStatView(value: 10, title: "Post")
                            UserStatView(value: 10, title: "Followers")
                            UserStatView(value: 10, title: "Following")
                        }
                    }
                    .padding(.horizontal)
                    
                    // 2. İsim ve Biyo
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Berivan Dağcı")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Merhaba ben beri_os")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // 3. Buton
                    Button {} label: {
                        Text("Edit Profil")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundStyle(Color.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.primary.opacity(0.4), lineWidth: 1)
                            )
                    }
                    
                    Divider()
                    
                    // 4. Izgara (Grid) - Kaydırmayı tetikleyen asıl alan
                    LazyVGrid(columns: gridItems, spacing: 1) {
                        ForEach(0..<50, id: \.self) { index in
                            Image("ben")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 120)
                                .clipped()
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {} label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color.primary)
                    }
                }
            }
        }
    }
}
