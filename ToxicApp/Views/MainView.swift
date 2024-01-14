//
//  MainView.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 13.01.2024.
//

import SwiftUI

    
struct MainView: View {
    @State var labelHeight = CGFloat.zero
    
    @StateObject var toxicManager:ToxicManager
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: UIImage(named: "Toxicity") ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: labelHeight)
                Toggle("#Toxicity", isOn: $toxicManager.isToxic).toggleStyle(SwitchToggleStyle(tint: .green))
                    .overlay(
                        GeometryReader(content: { geometry in
                            Color.clear
                                .onAppear(perform: {
                                    self.labelHeight = geometry.frame(in: .local).size.height
                                })
                        })
                    )
                    .onChange(of: toxicManager.isToxic){
                        toxicManager.setToxicState(state: toxicManager.isToxic)
                        if toxicManager.isToxic{
                            toxicManager.setTimeSinceNow()
                        } else {
                            toxicManager.clearTimeSince()
                        }
                    }
            }.padding()
            if(toxicManager.isToxic){
                Text("#YouBeenToxic")
                
                Text(toxicManager.FormatTime(seconds: toxicManager.seconds))
                .onReceive(timer) { _ in
                    toxicManager.seconds += 1
                }
            }
            AboutView()
        }


        
        
        
    }
}


