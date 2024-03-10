//
//  SongDetailView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct SongDetailView: View {
    
    let song: Song
    
    var body: some View {
        Text("Hello, SongDetailView!")
    }
}

#Preview {
    SongDetailView(song: Song.example())
}
