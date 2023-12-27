//
//  SongPlayerViewModel.swift
//  swiftuimusicplayer
//
//  Created by Vinayak Nikam on 27/12/23.
//

import Foundation
import AVFoundation

class SongPlayerViewModel: ObservableObject {
    @Published var selectedSong: Song
    
    var player: AVPlayer?
    var isPlaying: Bool = false
    
    init(selectedSong: Song) {
        self.selectedSong = selectedSong
        let playerItem = AVPlayerItem(url: selectedSong.songUrl)
        player = AVPlayer(playerItem: playerItem)
    }
    
    func playSong() {
        if(isPlaying) {
            player?.pause()
        }
        else {
            player?.play()
        }
        isPlaying = !isPlaying
    }
}
