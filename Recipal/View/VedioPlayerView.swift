//
//  VedioPlayerView.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 19/09/2023.
//

import SwiftUI
import AVKit

struct VedioPlayerView: View {
    var vedioLink : String = ""
    @State var vedioPlayer : AVPlayer?
    var body: some View {
        if playVideo(videoLink: vedioLink) != nil{
            VideoPlayer(player: vedioPlayer)
                .frame(width: UIScreen.main.bounds.width,height: 300, alignment: .center)
                .onDisappear {
                    vedioPlayer?.pause()
                }
                .onAppear {
                    vedioPlayer = playVideo(videoLink: vedioLink)
                    vedioPlayer?.play()
                }
        }else{
            LottieView(filename: "animation_lkqej87r")
                .scaledToFill()
        }
        
    }
        
}

struct VedioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VedioPlayerView()
    }
}
