import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
         FeedView()
                .tabItem { Image(systemName: "house") }
            
        SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
            
            Text("Upload Post")
                .tabItem { Image(systemName: "plus.square") }
            
            Text("Notifications")
                .tabItem { Image(systemName: "heart") }
            
            // DÜZELTME BURADA:
            CurrentUserProfileView(user: User.MOCK_USER[0])
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(Color.primary)
    }
}

#Preview {
    MainTabView()
}
