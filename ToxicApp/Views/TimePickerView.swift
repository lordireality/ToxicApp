//
//  TimePickerView.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation
import SwiftUI

struct TimePickerView: View {
    @State var hours = 0
    @State var minutes = 0
    @State var seconds = 0
    @Binding var totalSelectedSeconds:Int64
    let hoursRange = 0..<24
    let minutesRange = 0..<60
    let secondsRange = 0..<60
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            HStack {
                Picker("#Hours", selection: $hours) {
                    ForEach(hoursRange, id: \.self) {
                        Text(String(format: NSLocalizedString("%d #Hours", comment: ""), $0))
                    }
                }
                .pickerStyle(WheelPickerStyle())
                Picker("#Minutes", selection: $minutes) {
                    ForEach(minutesRange, id: \.self) {
                        Text(String(format: NSLocalizedString("%d #Minutes", comment: ""), $0))
                    }
                }
                .pickerStyle(WheelPickerStyle())
                Picker("#Seconds", selection: $seconds) {
                    ForEach(secondsRange, id: \.self) {
                        Text(String(format: NSLocalizedString("%d #Seconds", comment: ""), $0))
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            Spacer()
            Button("#Submit") {
                totalSelectedSeconds = Int64((((hours*60)+minutes)*60)+seconds)
                dismiss()
            }
            .foregroundColor(Color.green)
        }
        .padding()
    }
}
