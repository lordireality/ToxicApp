//
//  ToxicAppApp.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 13.01.2024.
//

import SwiftUI

@main

struct ToxicApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appDelegate.toxicManager)
        }
    }
}
