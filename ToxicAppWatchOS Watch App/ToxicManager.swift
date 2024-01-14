//
//  ToxicManager.swift
//  ToxicAppWatchOS Watch App
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation

class ToxicManager{
    init (){
        
    }
    func clearTimeSince(){
        UserDefaults.standard.setValue("", forKey: UserDefaults.Keys.toxicSince.rawValue)
    }
    func setTimeSinceNow(){
        let datetimenow = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let formatteddate = formatter.string(from: datetimenow)
        UserDefaults.standard.setValue(formatteddate, forKey: UserDefaults.Keys.toxicSince.rawValue)
    }
    
    func getSecondsSince() ->Int64{
        let startVal = UserDefaults.standard.string(forKey: UserDefaults.Keys.toxicSince.rawValue)
        if let startVal{
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
            if let formatteddate = formatter.date(from: startVal){
                let secondsBetween = Int64(Date().timeIntervalSince(formatteddate))
                return abs(secondsBetween)
            } else {
                return 0
            }
            
        } else {
            return 0
        }
    }
    func getSavedToxicState() ->Bool{
        return UserDefaults.standard.bool(forKey: UserDefaults.Keys.isToxic.rawValue)
    }
    func setToxicState(state: Bool){
        UserDefaults.standard.setValue(state, forKey: UserDefaults.Keys.isToxic.rawValue)
    }
    func FormatTime(seconds:Int64)->String{
        let (d, h, m, s) = (seconds / 86400 ,(seconds % 86400) / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        var formatedTime = ""
        
        formatedTime += (d != 0) ? String(format: NSLocalizedString("%d #Days", comment: ""), d) : ""
        formatedTime += (d > 0 || h > 0) ? String(format: NSLocalizedString("%d #Hours", comment: ""), h): ""
        formatedTime += (d > 0 || h > 0 || m > 0) ? String(format: NSLocalizedString("%d #Minutes", comment: ""), m) : ""
        formatedTime += (d > 0 || h > 0 || m > 0 || s>0) ? String(format: NSLocalizedString("%d #Seconds", comment: ""), s) : ""
        return formatedTime
        
    }
}
