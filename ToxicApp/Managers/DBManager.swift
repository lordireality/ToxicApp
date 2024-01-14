//
//  DBManager.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation
import CoreData
import os


class DBManager: ObservableObject{
    public var container: NSPersistentContainer
    
    lazy var backgroundContext: NSManagedObjectContext = {
        let newbackgroundContext = container.newBackgroundContext()
        newbackgroundContext.automaticallyMergesChangesFromParent = true
        return newbackgroundContext
    }()
    
    private init(){
        let container = NSPersistentContainer(name: "ToxicAppModel")
        container.loadPersistentStores { storeDescription, error in
            if let error {
                fatalError("Error while initialising Cotainer \(error.localizedDescription)")
            }
        }
        self.container = container
    }
    
    public static let shared = DBManager.init()
    
    private func saveContext(){
        let context = self.backgroundContext
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("Save error \(error.localizedDescription)")
            }
        }
    }
    
}
