//
//  ToxicityRoundView.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import SwiftUI

struct ToxicityRoundView: View {
    var colors: [Color] = [Color.darkGreen, Color.lightGreen]
    @StateObject var toxicManager:ToxicManager
    var body: some View {
        ZStack {
            let progress:CGFloat = CGFloat(toxicManager.seconds) / CGFloat(toxicManager.toxicSecondsTarget)
            var percents = progress.isNaN || progress.isInfinite ? 0 : Int64(progress*100)
            Text("\(percents)%")
                Circle()
                    .stroke(Color.outlineGreen, lineWidth: 20)
                Circle()
            .trim(from: 0, to: progress)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: colors),
                            center: .center,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360)
                        ),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                ).rotationEffect(.degrees(-90))
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.darkGreen)
                    .offset(y: -75)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(progress > 0.95 ? Color.lightGreen: Color.lightGreen.opacity(0))
                    .offset(y: -75)
                    .rotationEffect(Angle.degrees(360 * Double(progress)))
                    .shadow(color: progress > 0.96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
            }.frame(width: 150, height: 150, alignment: .center)
            .padding()
    }
}

