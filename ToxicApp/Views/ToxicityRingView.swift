//
//  ToxicityRing.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import SwiftUI

struct ToxicityRingView: View {
    @State private var progress: CGFloat = 0
    @StateObject private var toxicManager:ToxicManager
    @State private var isTimePickerPresented = false
    @State private var selectedSeconds: Int64 = 0
   
    init(toxicManager: ToxicManager){
        _toxicManager = StateObject(wrappedValue: toxicManager)
        _selectedSeconds = State(wrappedValue: toxicManager.toxicSecondsTarget)
    }
    var body: some View {
        VStack{
            ToxicityRoundView(toxicManager: toxicManager)
            Divider()
            Divider()
            HStack{
                VStack{
                    Text("#ToxicityTarget")
                    Text("\(toxicManager.FormatTime(seconds: toxicManager.toxicSecondsTarget))")
                }
                
                Spacer()
                Button("#Change"){
                    isTimePickerPresented.toggle()
                }
                .foregroundColor(Color.green)
                .cornerRadius(15)
                .buttonStyle(.bordered)
                //TODO: Исправить блядь корежит из за редрава UI
                .sheet(isPresented: $isTimePickerPresented, onDismiss: timePickerOnDismiss) {
            
                    let (d, h, m, s) = (Int(selectedSeconds / 86400) ,Int((selectedSeconds % 86400) / 3600), Int((selectedSeconds % 3600) / 60), Int((selectedSeconds % 3600) % 60))
        
                    TimePickerView(hours: h,minutes: m,seconds: s,totalSelectedSeconds: $selectedSeconds)
                }

            }
            
        }.frame(alignment: .top)
        //TODO: invalid frame dimension
    }
    func timePickerOnDismiss(){
        isTimePickerPresented = false;
        toxicManager.setCurToxicTarget(target: selectedSeconds)
    }
}

