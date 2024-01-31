//
//  AchievmentsModels.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 31.01.2024.
//

import Foundation


struct AchievmentModel {
    var id:UUID
    var name:String
    var category:String //peredelat
    var isUnlocked:Bool
    var iconData: Data?
    init(id: UUID, name: String, category: String, isUnlocked: Bool, iconData: Data? = nil) {
        self.id = .init()
        self.name = name
        self.category = category
        self.isUnlocked = isUnlocked
        self.iconData = iconData
    }
}
struct AchievmentCategoryModel{
    var id:UUID
    var name:String
}
