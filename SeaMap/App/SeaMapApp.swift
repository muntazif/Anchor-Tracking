//
//  SeaMapApp.swift
//  SeaMap
//
//  Created by İbrahim Güler on 8.08.2021.
//

import SwiftUI

@main
struct SeaMapApp: App {
    
    let persistenceController = PersistenceController.shared
    let locationManager = LocationManager.init()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.setting.viewContext)
                .environment(\.managedObjectContext, persistenceController.anchor.viewContext)
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .background:
                persistenceController.saveSetting()
            case .inactive:
                print("Apple Inactive")
            case .active:
                print("Apple Active")
            @unknown default:
                print("Apple changed")
            }
        }
    }
}
