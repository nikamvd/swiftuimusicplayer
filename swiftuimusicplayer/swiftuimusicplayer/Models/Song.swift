//
//  Song.swift
//  swiftuimusicplayer
//
//  Created by Vinayak Nikam on 15/10/23.
//

import Foundation

struct SongData: Decodable {
    let songs: [Song]
}

struct Song: Identifiable, Decodable {
    let id: UUID = UUID()
    let pictureUrl: URL
    let songUrl: URL
    let songName: String
    let filmName: String
}

