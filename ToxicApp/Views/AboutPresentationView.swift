//
//  AboutPresentationView.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import SwiftUI

struct AboutPresentationView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                .resizable()
                .frame(width: 250.0, height: 250.0)
            HStack{
                Text("#AppName")
                    .font(.largeTitle)
                if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                    Text("#Ver\(version)").font(.footnote).italic()
               }
            }
            Divider()
                Text("#About_CreatedBy")
                
                Text("#About_Inspired")
                .italic()
            VStack{
                Divider()
                Button("#Close") {
                    dismiss()
                }.font(.title)
                .cornerRadius(15)
                .buttonStyle(.bordered)
                .foregroundColor(Color.green)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

#Preview {
    AboutPresentationView()
}
