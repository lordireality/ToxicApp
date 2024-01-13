//
//  ToxicManager.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation

class ToxicManager{
    
    init (){
        
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
