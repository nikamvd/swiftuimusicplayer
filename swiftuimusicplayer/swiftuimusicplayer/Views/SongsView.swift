//
//  SongsView.swift
//  swiftuimusicplayer
//
//  Created by Vinayak Nikam on 15/10/23.
//

import SwiftUI

struct SongsView: View {
    @ObservedObject var viewModel: SongsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.songs) { song in
                HStack {
                    // Circular song picture
                    PosterView(imageUrl: song.pictureUrl)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .frame(width: 100, height: 100)
                    
                    // Song details
                    VStack(alignment: .leading) {
                        Text(song.songName)
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(song.filmName)
                            .font(.subheadline)
                    }
                }
            }
            .navigationBarTitle("Songs")
        }
    }
}


struct SongsView_Previews: PreviewProvider {
    static var previews: some View {
        SongsView(viewModel: SongsViewModel(service: SongsService()))
    }
}
