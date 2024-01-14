//
//  ToxicManager.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation

class ToxicManager: ObservableObject{
    
    private var sm:SessionManager = SessionManager()
    @Published var isToxic = false
    @Published var seconds: Int64 = 0
    @Published var totalSeconds: Int64 = 0
    
    init (){
        isToxic = self.getSavedToxicState()
        if isToxic {
            seconds = getSecondsSince()
        } else {
            seconds = 0
        }
    }
    func sendCurrentInfoToWatches(){
        if(sm.session.isReachable){
            sm.SendMessage(messages: ["ToxicInfoState": ToxicModel(isToxic: getSavedToxicState(), toxicSince: getToxicSinceStr())])
        }
    }
    
    func clearTimeSince(){
        UserDefaults.standard.setValue("", forKey: UserDefaults.Keys.toxicSince.rawValue)
        self.seconds = 0
        self.sendCurrentInfoToWatches()
    }
    func setTimeSinceNow(){
        let datetimenow = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let formatteddate = formatter.string(from: datetimenow)
        UserDefaults.standard.setValue(formatteddate, forKey: UserDefaults.Keys.toxicSince.rawValue)
        self.sendCurrentInfoToWatches()
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
        self.sendCurrentInfoToWatches()
    }
    func getToxicSinceStr() -> String{
        return UserDefaults.standard.string(forKey: UserDefaults.Keys.toxicSince.rawValue) ?? ""
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
