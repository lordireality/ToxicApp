//
//  AchievmentsMenuView.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import SwiftUI



struct AchievmentsMenuView: View {
    @StateObject var achManager: AchievmentsManager = AchievmentsManager.shared;
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                ForEach(achManager.achievmentsGrouppedCache.keys.sorted(), id: \.self){ key in
                    VStack{
                        HStack{
                            Text(key)
                            VStack{
                                Divider()
                            }
                        }
                        ScrollView(.horizontal){
                            if let achievments = achManager.achievmentsGrouppedCache[key]{
                                ForEach(achievments){ ach in
                                    NavigationLink(destination: AchievmentView()) {
                                        Text("test")
                                    }
                                }
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
