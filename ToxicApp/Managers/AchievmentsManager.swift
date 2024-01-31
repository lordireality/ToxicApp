//
//  AchievmentsManager.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation

class AchievmentsManager: ObservableObject{
    
    var achievmentsCache:[AchievmentModel] = []
    
    init()  {

    }
    
    func getAllCategory() async->[AchievmentCategoryModel]{
        return []
    }
    func getAllAchievments() async->[AchievmentModel]{
        return []
    }
    
    func checkStoredAchievments(){
        
    }
    func createAchievments(){
        
    }
    
    
}
