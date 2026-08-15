//
//  ContentView.swift
//  InstaClone
//
//  Created by beri on 6.07.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registerViewModel = RegisterViewModel() // @State yerine @StateObject olması daha doğrudur
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                MainTabView()
            }
        }
        .environmentObject(registerViewModel) // İşte buraya ekliyoruz!
    }
}

#Preview {
    ContentView()
}
