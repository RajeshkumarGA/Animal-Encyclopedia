//
//  videoPlayer.swift
//  Animals Encyclopedia
//
//  Created by Admin on 25/12/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormet: String) -> AVPlayer{
    if Bundle.main.url(forResource: fileName, withExtension: fileFormet) != nil{
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormet)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
