//
//  SongPlayerViewModel.swift
//  swiftuimusicplayer
//
//  Created by Vinayak Nikam on 27/12/23.
//

import Foundation

class SongPlayerViewModel: ObservableObject {
    @Published var selectedSong: Song
    
    init(selectedSong: Song) {
        self.selectedSong = selectedSong
    }
}
