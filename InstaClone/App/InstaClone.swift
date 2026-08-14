//
//  InstaClone.swift
//  InstaClone
//
//  Created by beri on 14.08.2026.
//

import SwiftUI
import FirebaseCore

class AppDelegate : NSObject , UIApplicationDelegate {
    func application ( _ application : UIApplication ,
                       didFinishLaunchingWithOptions launchOptions : [ UIApplication . LaunchOptionsKey : Any ]? = nil ) -> Bool {
        FirebaseApp.configure ( )

        return true
    }
}

struct YourApp : App {
    // Firebase kurulumu için uygulama temsilcisini kaydet
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body : some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}

struct InstaClone: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    InstaClone()
}
