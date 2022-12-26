//
//  VideoPlayerView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 25/12/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var videoSelected : String
    var videoTitle : String
    var body: some View {
        
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormet: "mp4")){
//                Text(videoTitle)
            }
            .overlay(alignment: .topLeading, content: {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32,height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
            })
        } // VSTACK
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var aniimalVideos : [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        NavigationView(content: {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        })
           
    }
}
