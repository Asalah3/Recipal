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
        VideoPlayer(player: vedioPlayer)
            .frame(width: UIScreen.main.bounds.width,height: 300, alignment: .center)
            .onDisappear {
                vedioPlayer?.pause()
            }
            .onAppear {
                vedioPlayer = playVideo(videoLink: vedioLink)
                vedioPlayer?.play()
            }
    }
        
}

struct VedioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VedioPlayerView()
    }
}
