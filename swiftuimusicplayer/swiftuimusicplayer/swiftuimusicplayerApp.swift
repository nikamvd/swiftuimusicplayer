//
//  swiftuimusicplayerApp.swift
//  swiftuimusicplayer
//
//  Created by Vinayak Nikam on 15/10/23.
//

import SwiftUI

@main
struct swiftuimusicplayerApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //SongsView(viewModel: SongsViewModel(service: SongsService()))
            let selectedSong = Song(
                pictureUrl:URL(string: "https://samusicplayer.blob.core.windows.net/cmusicplayer/Phulrani_Poster.jpg")!,
                songUrl:URL(string: "https://samusicplayer.blob.core.windows.net/cmusicplayer/Phulrani_HirveHirve.mp3")!,
                songName:"Hirve Hirve Gaar Gaaliche",
                filmName:"Phulrani")
            SongPlayerView(viewModel: SongPlayerViewModel(selectedSong: selectedSong))
        }
    }
}
