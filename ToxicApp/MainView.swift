//
//  MainView.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 13.01.2024.
//

import SwiftUI

    
struct MainView: View {
    //@StateObject
    @State var labelHeight = CGFloat.zero
    @State private var isToxic = false
    @State var seconds: Int64 = 0
    var toxicManager = ToxicManager()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
#Preview {
    MainView()
}

