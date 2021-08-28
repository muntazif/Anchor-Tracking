//
//  Persistence.swift
//  SeaMap
//
//  Created by İbrahim Güler on 16.08.2021.
//


import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let setting: NSPersistentContainer
    
    let anchor : NSPersistentContainer
    
    init() {
        setting = NSPersistentContainer(name: "SeaMap")
        setting.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        anchor = NSPersistentContainer(name: "SeaMap")
        anchor.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func getAllSetting() -> [Setting] {
        let context = setting.viewContext
        let fetchRequest: NSFetchRequest<Setting> = Setting.fetchRequest()
        
        do {
            var settingArray = try context.fetch(fetchRequest) as [Setting]
            if settingArray.count == 0{
                addSetting(delay: Int32(5), selected: Int16(1))
                saveSetting()
                settingArray = try context.fetch(fetchRequest) as [Setting]
            }
            return settingArray
        } catch {
            return [Setting()]
        }
    }
    
    func saveSetting(complation: @escaping (Error?) -> () = {_ in} ) {
        let context = setting.viewContext
        if context.hasChanges {
            do {
                try context.save()
                complation(nil)
            } catch {
                context.rollback()
                complation(error)
            }
        }
    }
    
    func addSetting(delay: Int32, selected: Int16 ,complation: @escaping (Error?)-> () = {_ in }) {
        let settings = Setting(context: setting.viewContext)
        settings.delay = Int32(delay) 
        settings.selected = Int16(selected) 
        saveSetting(complation: complation)
    }
    
    func getAllAnchor() -> [Anchor] {
        let context = anchor.viewContext
        let fetchRequest: NSFetchRequest<Anchor> = Anchor.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest) as [Anchor]
        } catch {
            return [Anchor()]
        }
    }
    
    func saveAnchor(complation: @escaping (Error?) -> () = {_ in} ) {
        let context = anchor.viewContext
        if context.hasChanges {
            do {
                try context.save()
                complation(nil)
            } catch {
                context.rollback()
                complation(error)
            }
        }
    }
    
    func addAnchor(latitude: Double, longitude: Double ,complation: @escaping (Error?)-> () = {_ in }) {
        let anchor = Anchor(context: anchor.viewContext)
        anchor.latitude = latitude
        anchor.longitude = longitude
        anchor.datetime = Date()
        saveSetting(complation: complation)
    }
}
