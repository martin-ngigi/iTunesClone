//
//  MovieRowView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    var body: some View {
        HStack{
            ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
            
            VStack(alignment: .leading) {
                Text(movie.trackName)
                Text(movie.primaryGenreName)
                    .foregroundStyle(.gray)
                Text(movie.releaseDate)
            }
            .font(.caption)
            
            Spacer()
            
            BuyButton(urlString: movie.previewURL ?? "", price: movie.trackPrice, currency: movie.currency)
        }
    }
}

#Preview {
    MovieRowView(movie: Movie.example())
}
