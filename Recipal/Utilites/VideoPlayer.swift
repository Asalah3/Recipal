//
//  VideoPlayer.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 15/09/2023.
//

import Foundation
import AVKit
import _AVKit_SwiftUI

var videoPlayer : AVPlayer?

func playVideo(videoLink : String) -> AVPlayer?{
    if videoLink != "" {
        videoPlayer = AVPlayer(url: (URL(string: videoLink)!))
    }
    
    return videoPlayer
}
