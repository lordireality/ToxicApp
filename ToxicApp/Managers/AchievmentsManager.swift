//
//  AchievmentsManager.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation

class AchievmentsManager: ObservableObject{
    
    private var dbm = DBManager.shared
    
    var achievmentsCache:[Achievment] = []
    var categoryCache:[Category] = []
    
    init() async{
        self.categoryCache =  await getAllCategory()
        self.achievmentsCache = await getAllAchievments()
    }
    
    func getAllCategory() async->[Category]{
        return await dbm.getCategories()
    }
    func getAllAchievments() async->[Achievment]{
        return await dbm.getAchievments()
    }
    
    func checkStoredAchievments(){
        
    }
    func createAchievments(){
        
    }
    
    
}
