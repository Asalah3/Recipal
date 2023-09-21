//
//  Loader.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 16/09/2023.
//

import SwiftUI

struct Loader: View {
    var body: some View {
        Color.clear
            .ignoresSafeArea()
            .overlay(
                ProgressView()
                    .tint(Color("MainColor"))
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(3.0)
            )
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
