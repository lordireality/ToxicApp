//
//  ContentView.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 13.01.2024.
//

import SwiftUI
public let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
struct ContentView: View {
    @EnvironmentObject var toxicManager: ToxicManager
    @State var activeTab = "ToxicityView"
    var body: some View {
        
        HStack{
            TabView(selection: $activeTab){
                MainView(toxicManager: toxicManager)
                     .tabItem {
                         Label("#MainView", systemImage: "trash.fill")
                     }
                     .tag("ToxicityView")
                     
                AchievmentsMenuView()
                     .tabItem {
                         Label("#Achievments", systemImage: "trophy.fill")
                     }
                     .tag("AchivevmentsMenuView")
                ToxicityRingView(toxicManager: toxicManager)
                     .tabItem {
                         Label("#ToxicityRing", systemImage: "circle.circle")
                     }
                     .tag("ToxicityRingView")
            }.sensoryFeedback(.selection, trigger: activeTab)
            
        }.padding()
        
    }
}

#Preview {
    ContentView()
}
