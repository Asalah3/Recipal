//
//  Loader.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 16/09/2023.
//

import SwiftUI
import Lottie

struct Loader: View {
    var body: some View {
        Color.clear
            .ignoresSafeArea()
            .overlay(
                LottieView(filename: "loadingView")
                    .scaleEffect(0.7)
//                ProgressView()
//                    .tint(Color("MainColor"))
//                    .progressViewStyle(CircularProgressViewStyle())
//                    .scaleEffect(3.0)
            )
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
