//
//  UserDefaultsExtension.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation

extension UserDefaults {

    enum Keys: String, CaseIterable {
        case isFirstAppLaunch
        case isToxic
        case toxicSince
        case CurToxicTarget
    }
    func reset() {
        Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }

}
