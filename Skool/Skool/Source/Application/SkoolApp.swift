//
//  SkoolApp.swift
//  Skool
//
//  Created by dgsw30 on 11/22/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


@main
struct SkoolApp: App {
    @AppStorage("userEmail") private var userInformation: String?
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            if userInformation == nil {
                LoginView()
            } else {
                Main()
            }
        }
    }
}
