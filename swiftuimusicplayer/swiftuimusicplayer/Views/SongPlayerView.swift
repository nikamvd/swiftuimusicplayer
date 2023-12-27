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
            // Back Button
            HStack(alignment: .center) {
                Button(action: {}) {
                    Image(systemName: "backward.end.fill")
                        .padding()
                }
                Spacer()
            }
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
                .foregroundColor(.white)
                .padding(.top, 10)
            
            // Slider and duration labels
            HStack {
                Text("0:00")
                    .foregroundColor(.white)
                Slider(value: $speed,
                       in: 0...100)
                    .tint(.purple)
                    .foregroundColor(.white)
                Text("3:30")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            // Song text
            Text(viewModel.selectedSong.songName)
                .font(.body)
                .foregroundColor(.white)
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
                Button(action: {
                    viewModel.playSong()
                }) {
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
            .padding(.horizontal)
        }
        .padding(10)
        .background(LinearGradient(gradient: Gradient(colors: [
                Color(red: 255 / 255, green: 75 / 255, blue: 170 / 255),
                Color(red: 77 / 255, green: 54 / 255, blue: 185 / 255)
            ]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct SongPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let selectedSong = Song(
            pictureUrl:URL(string: "https://samusicplayer.blob.core.windows.net/cmusicplayer/Phulrani_Poster.jpg")!,
            songUrl:URL(string: "https://samusicplayer.blob.core.windows.net/cmusicplayer/Phulrani_HirveHirve.mp3")!,
            songName:"Hirve Hirve Gaar Gaaliche",
            filmName:"Phulrani")
        SongPlayerView(viewModel: SongPlayerViewModel(selectedSong: selectedSong))
    }
}
