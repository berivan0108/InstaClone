//
//  ContentViewModel.swift
//  InstaClone
//
//  Created by beri on 14.08.2026.
//
import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>() // Değişken adındaki harf hatası düzeltildi
    
    @Published var currentUser: User?
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setupSubscribers() // Fonksiyon adındaki harf hatası (subcibers -> subscribers) düzeltildi
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] session in
            self?.userSession = session
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellables)
    }
}
