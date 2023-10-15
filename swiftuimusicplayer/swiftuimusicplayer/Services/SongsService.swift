//
//  SongsService.swift
//  swiftuimusicplayer
//
//  Created by Vinayak Nikam on 15/10/23.
//

import Foundation

class SongsService {
    func getSongs(completion: @escaping ([Song]?) -> Void) {
        
        URLSession.shared.dataTask(with: Constants.songsURL) { data, _, error in
            guard let data = data, error == nil else {
                print("Error decoding JSON: \(error!)")
                completion(nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(SongData.self, from: data)
                let songs = decodedData.songs
                completion(songs)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
