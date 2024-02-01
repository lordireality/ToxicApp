//
//  AchievmentsManager.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation

class AchievmentsManager: ObservableObject{
    
    public static let shared = AchievmentsManager.init()
    
    public var achievmentsCache:[AchievmentModel] = []
    public var achievmentsGrouppedCache:[String : [AchievmentModel]] = [:]
    private init()  {
        let achList = getAllAchievments();
        let list = Dictionary(grouping: achList) { $0.category.name }
        self.achievmentsGrouppedCache = list
        self.achievmentsCache = achList;
    }
    
    func getAllAchievments()->[AchievmentModel]{
        var achievments:[AchievmentModel] = []
        
        let jsonString = readStr(resoursePath: "achievments", ext: "json", subdir: "DataFiles") ?? ""
        
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                let achievmentsList = try JSONDecoder().decode(AchievmentList.self, from: jsonData)
                for achievment in achievmentsList.achievments {
                    achievments.append(achievment)
                }
            } catch {
                return []
            }
        }
        return achievments;
    }
    ///Чтение строки из файла по пути с расширением
    private func readStr(resoursePath : String, ext : String, subdir : String?) -> String?{
        if let fileURL = Bundle.main.url(forResource: resoursePath, withExtension: ext, subdirectory: subdir) {
            do {
                let contents = try String(contentsOf: fileURL)
                return contents
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
