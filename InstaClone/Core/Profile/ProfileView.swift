import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POST.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                // Hata düzeltildi: Kendi kendini çağırmak yerine ProfileHeaderView kullanıldı
                ProfileHeaderView(user: user)
                
                // 4. Izgara (Grid)
                PostGridView(posts: posts)
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

#Preview {
    ProfileView(user: User.MOCK_USER[0])
}
