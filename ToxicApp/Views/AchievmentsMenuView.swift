//
//  AchievmentsMenuView.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import SwiftUI



struct AchievmentsMenuView: View {
    @StateObject var achManager: AchievmentsManager = AchievmentsManager();
    var body: some View {
        NavigationStack{
            
            ForEach(achManager.categoryCache) { cat in
                VStack{
                    HStack{
                        Text(cat.localName ?? "")
                        VStack{
                            Divider()
                        }
                    }
                    ScrollView(.horizontal){
                        var achievments = achManager.achievmentsCache.filter{c in c.category == cat.id}
                        ForEach(achievments){ ach in
                            NavigationLink(destination: AchievmentView()) {
                                Text("test")
                            }
                        }
                        
                    }
                    
                }
                
            }
            
            
            //}
            
        }
    }
}

#Preview {
    AchievmentsMenuView()
}
