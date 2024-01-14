//
//  SessionManager.swift
//  ToxicAppWatchOS Watch App
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation
import WatchKit
import WatchConnectivity

class SessionManager: WKInterfaceController, WCSessionDelegate{

    var session: WCSession!
    override func willActivate() {
        super.willActivate()
       
        if (WCSession.isSupported()) {
            session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
   
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}

    func getDataFromPhone(){
        func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
            if let userData = applicationContext["ToxicInfoState"] as? [String: Any] {
                // Обработка полученных данных
            }
        }

    }
    func sedDataToPhone(){
        
    }
}


