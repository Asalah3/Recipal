//
//  RecipalApp.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

@main
struct RecipalApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var favouriteViewModel = FavouriteViewModel()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(favouriteViewModel)
            
        }
    }
}
