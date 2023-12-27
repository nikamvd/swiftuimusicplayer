//
//  SongsViewModel.swift
//  swiftuimusicplayer
//
//  Created by Vinayak Nikam on 15/10/23.
//

import Foundation
import Combine

class SongsViewModel: ObservableObject {
    @Published var songs: [Song] = []
    private let service: SongsService
    
    private lazy var fetchSongsPublisher: AnyPublisher<[Song], Never> = {
        self.service.getSongData()
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }()
    
    init(service: SongsService) {
        self.service = service
        fetchSongs()
    }
    
    func fetchSongs() {
        /*
        service.getSongs { [weak self] songs in
            DispatchQueue.main.async {
                self?.songs = songs ?? []
            }
        }
         */
        fetchSongsPublisher
              .assign(to: &$songs)
    }
}
