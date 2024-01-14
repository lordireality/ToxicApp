//
//  AboutView.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import SwiftUI

struct AboutView: View {
    @State var showingAbout:Bool = false
    var body: some View {
        Button("#About"){
            if !showingAbout {
                showingAbout = true
                impactFeedback.impactOccurred()
            }
        }
        .foregroundColor(Color.green)
        .sheet(isPresented: $showingAbout, onDismiss: dismissAbout){
            AboutPresentationView()
            .presentationDragIndicator(.visible)
        }
        .cornerRadius(15)
        .buttonStyle(.bordered)
        
    }
    func dismissAbout(){
        showingAbout = false;
    }
}

#Preview {
    AboutView()
}
