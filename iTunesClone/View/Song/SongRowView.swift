//
//  SongRowView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct SongRowView: View {
    let song: Song
    
    var body: some View {
        HStack {
            ImageLoadingView(urlString: song.artworkUrl60, size: 60)
            
            VStack(alignment: .leading){
                Text(song.trackName)
                Text(song.artistName + " - " + song.collectionName)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .lineLimit(1)
            
            Spacer( minLength: 20)
            
            BuySongButton(urlString: song.previewURL, price: song.trackPrice, currency: song.currency)
        }
    }
}

#Preview {
    SongRowView(song: Song.example())
}
