//
//  MovieSectionView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct MovieSectionView: View {
    
    var movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 0){
                ForEach(movies) { movie in
                    VStack(alignment: .leading){
                        ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
                        
                        Text(movie.trackName)
                        
                        Text(movie.primaryGenreName)
                            .foregroundStyle(Color.gray)
                    }
                    .lineLimit(2)
                    .frame(width: 80)
                    .font(.caption)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    MovieSectionView(movies: [Movie.example()])
}
