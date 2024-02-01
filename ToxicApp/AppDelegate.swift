//
//  AppDelegate.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation
import Foundation
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var toxicManager = ToxicManager()
    //var achievmentManager = AchievmentsManager()
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    var timer: Timer?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        backgroundTask = application.beginBackgroundTask {
            application.endBackgroundTask(self.backgroundTask)
            self.backgroundTask = .invalid
        }

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.toxicManager.seconds += 1
        }

    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        if backgroundTask != .invalid {
            application.endBackgroundTask(backgroundTask)
            backgroundTask = .invalid
        }
        timer?.invalidate()
        timer = nil

    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}
