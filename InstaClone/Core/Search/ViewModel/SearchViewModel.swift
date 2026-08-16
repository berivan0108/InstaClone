//
//  SearchViewModel.swift
//  InstaClone
//
//  Created by beri on 16.08.2026.
//

import Foundation
class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    init(){
        Task { try await fetchAllUser()}
    }
    @MainActor
    func fetchAllUser() async throws{
        self.users = try await UserService().fetchAllUsers()
        
    }
}
