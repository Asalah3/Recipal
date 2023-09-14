//
//  SplashView.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 15/09/2023.
//

import SwiftUI

struct SplashView: View {
    let persistenceController = PersistenceController.shared
    @State private var isActive = false
    
    var body: some View {
        ZStack{
            Image("Splash")
                .resizable()
                .scaledToFill()
        }//outer ZStack
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.isActive = true
            }//DispatchQueue
        }//onAppear
        .fullScreenCover(isPresented: $isActive) {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
