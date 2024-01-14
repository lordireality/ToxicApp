//
//  ToxicAppWatchOSApp.swift
//  ToxicAppWatchOS Watch App
//
//  Created by Герман Зыкин on 14.01.2024.
//

import SwiftUI

@main
struct ToxicAppWatchOS_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(toxicManager: ToxicManager())
        }
    }
}
