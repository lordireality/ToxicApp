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
    func createAchievment(localName: String, category: UUID) async -> Achievment?{
        await withCheckedContinuation({ continuation in
            self.backgroundContext.performAndWait{
                let achivement = Achievment(context: self.backgroundContext)
                achivement.id = .init()
                achivement.localName = localName
                achivement.unlocked = false
                achivement.category = category
                self.saveContext()
                continuation.resume(returning: achivement)
            }
        })
    }
    func removeAchievment (achievment: Achievment) async -> Bool?{
        await withCheckedContinuation({ continuation in
            self.backgroundContext.performAndWait{
                self.backgroundContext.delete(achievment)
                self.saveContext()
                continuation.resume(returning: true)
            }
        })
    }
    func createCategory(localName: String) async -> Category?{
        await withCheckedContinuation({ continuation in
            self.backgroundContext.performAndWait{
                let category = Category(context: self.backgroundContext)
                category.id = .init()
                category.localName = localName
                self.saveContext()
                continuation.resume(returning: category)
            }
        })
    }
    func removeCategory (category: Category) async -> Bool?{
        await withCheckedContinuation({ continuation in
            self.backgroundContext.performAndWait{
                self.backgroundContext.delete(category)
                self.saveContext()
                continuation.resume(returning: true)
            }
        })
    }
    func getCategories() async -> [Category]{
        await withCheckedContinuation({ continuation in
            self.backgroundContext.performAndWait{
                let request = Category.fetchRequest()
                do{
                    let items = try self.backgroundContext.fetch(request)
                    continuation.resume(returning: items)
                }catch{
                    
                    continuation.resume(returning: [])
                }
            }
        })
    }
    func getAchievments() async -> [Achievment]{
        await withCheckedContinuation({ continuation in
            self.backgroundContext.performAndWait{
                let request = Achievment.fetchRequest()
                do{
                    let items = try self.backgroundContext.fetch(request)
                    continuation.resume(returning: items)
                }catch{
                    
                    continuation.resume(returning: [])
                }
            }
        })
    }
    
}
