//
//  CuspideApp.swift
//  Cuspide
//
//  Created by Hugo Martinez on 21/04/23.
//

import SwiftUI
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct CuspideApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if let _ = authenticationViewModel.user{
                HomeView(authenticationViewModel: authenticationViewModel)            }
            else{
                AuthenticationView(authenticationViewModel: authenticationViewModel)
            }

            
        }
    }
}
