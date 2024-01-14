//
//  ContentView.swift
//  ToxicAppWatchOS Watch App
//
//  Created by Герман Зыкин on 14.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State var labelHeight = CGFloat.zero
    
    var toxicManager:ToxicManager
    @State var isToxic = false
    @State var seconds: Int64 = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(toxicManager: ToxicManager){
        self.toxicManager = toxicManager
        _isToxic =  State(initialValue: self.toxicManager.getSavedToxicState())
        if(self.isToxic){
            _seconds =  State(initialValue: self.toxicManager.getSecondsSince())
        } else {
            self.seconds = 0
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: UIImage(named: "Toxicity") ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: labelHeight)
                Toggle("#Toxicity", isOn: $isToxic).toggleStyle(SwitchToggleStyle(tint: .green))
                    .overlay(
                        GeometryReader(content: { geometry in
                            Color.clear
                                .onAppear(perform: {
                                    self.labelHeight = geometry.frame(in: .local).size.height
                                })
                        })
                    )
                    .onChange(of: isToxic){
                        toxicManager.setToxicState(state: isToxic)
                        if isToxic{
                            toxicManager.setTimeSinceNow()
                        } else {
                            toxicManager.clearTimeSince()
                            seconds = 0
                        }
                    }
            }.padding()
            
            
        }

        if(isToxic){
            Text("#YouBeenToxic")
            
            Text(toxicManager.FormatTime(seconds: seconds))
            .onReceive(timer) { _ in
                seconds += 1
            }
        }
        
        
    }
}

//#Preview {
//    ContentView()
//}
