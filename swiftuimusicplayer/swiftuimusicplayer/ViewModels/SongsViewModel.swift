//
//  SongsViewModel.swift
//  swiftuimusicplayer
//
//  Created by Vinayak Nikam on 15/10/23.
//

import Foundation

class SongsViewModel: ObservableObject {
    @Published var songs: [Song] = []
    private let service: SongsService
    
    init(service: SongsService) {
        self.service = service
        fetchSongs()
    }
    
    func fetchSongs() {
        service.getSongs { [weak self] songs in
            DispatchQueue.main.async {
                self?.songs = songs ?? []
            }
        }
    }
}
