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
            SongsView(viewModel: SongsViewModel(service: SongsService()))
        }
    }
}
