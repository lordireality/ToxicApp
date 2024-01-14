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

    var body: some View {
        HStack{
            MainView(toxicManager: toxicManager)
        }
        
    }
}

#Preview {
    ContentView()
}
