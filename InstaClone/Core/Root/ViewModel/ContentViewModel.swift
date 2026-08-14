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
    private var cancelleables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    init(){
        setupSubcibers()
    }
    func setupSubcibers() {
        service.$userSession.sink(receiveValue: { [weak self] userSession in
            self?.userSession = userSession
        })
        .store(in: &cancelleables)
    }
}
