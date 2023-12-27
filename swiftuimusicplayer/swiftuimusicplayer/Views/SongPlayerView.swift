//
//  SongPlayerView.swift
//  swiftuimusicplayer
//
//  Created by Vinayak Nikam on 27/12/23.
//

import SwiftUI

struct SongPlayerView: View {
    @State private var speed = 50.0
    @ObservedObject var viewModel: SongPlayerViewModel
    
    var body: some View {
        VStack {
            // Circular image
            PosterView(imageUrl: viewModel.selectedSong.pictureUrl)
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.height / 3, height: UIScreen.main.bounds.height / 3)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Spacer()
            
            // Movie title
            Text(viewModel.selectedSong.filmName)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            // Slider and duration labels
            HStack {
                Text("0:00")
                    .foregroundColor(.gray)
                Slider(value: $speed,
                       in: 0...100)
                    .accentColor(.purple)
                Text("3:30")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            // Song text
            Text(viewModel.selectedSong.songName)
                .font(.body)
                .padding()
            
            Spacer()
            
            // Control buttons
            HStack {
                Button(action: {}) {
                    Image(systemName: "repeat")
                        .padding()
                }
                Button(action: {}) {
                    Image(systemName: "backward.end.fill")
                        .padding()
                }
                Button(action: {}) {
                    Image(systemName: "playpause")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(30)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                Button(action: {}) {
                    Image(systemName: "forward.end.fill")
                        .padding()
                }
                Button(action: {}) {
                    Image(systemName: "shuffle")
                        .padding()
                }
            }
            .font(.title)
            .padding()
        }
        .padding(10)
    }
}

struct SongPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        var selectedSong = Song(
            pictureUrl:URL(string: "https://samusicplayer.blob.core.windows.net/cmusicplayer/Phulrani_Poster.jpg")!,
            songUrl:URL(string: "https://samusicplayer.blob.core.windows.net/cmusicplayer/Phulrani_HirveHirve.mp3")!,
            songName:"Hirve Hirve Gaar Gaaliche",
            filmName:"Phulrani")
        SongPlayerView(viewModel: SongPlayerViewModel(selectedSong: selectedSong))
    }
}
