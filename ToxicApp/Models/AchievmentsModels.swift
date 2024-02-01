//
//  AchievmentsModels.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 31.01.2024.
//

import Foundation


struct AchievmentModel: Codable, Identifiable {
    var id:UUID = .init()
    var name:String
    var category:AchievmentCategoryModel //peredelat
    var isUnlocked:Bool
    var iconName: String
    enum CodingKeys: String, CodingKey {
        case name
        case category
        case isUnlocked
        case iconName
    }
    
    
}
struct AchievmentCategoryModel: Codable, Hashable{
    var id:UUID = .init()
    var name:String
    enum CodingKeys: String, CodingKey {
        case name
    }
}


///костыль для парса джсон
struct AchievmentList: Codable {
    var achievments: [AchievmentModel]
}

