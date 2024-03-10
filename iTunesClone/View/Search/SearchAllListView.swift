//
//  SearchAllListView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    @ObservedObject var songListViewModel: SongListViewModel
    @ObservedObject var movieListViewModel: MovieListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 5){
                if songListViewModel.songs.count > 0 {
                    SelectionHeaderView(title: "Songs") {
                        SongListView(viewModel: songListViewModel)
                    }
                    .padding(.top)
                    
                    SongSectionView(songs: songListViewModel.songs)
                    
                    Divider()
                        .padding(.bottom)
                }
                
                if albumListViewModel.albums.count > 0 {
                    SelectionHeaderView(title: "Albums") {
                        AlbumListView(viewModel: albumListViewModel)
                    }
                                    
                    AlbumSectionView(albums: albumListViewModel.albums)
                    
                    Divider()
                        .padding(.bottom)
                }
                if movieListViewModel.movies.count > 0 {
                    SelectionHeaderView(title: "Movies") {
                        MovieListView(viewModel: movieListViewModel)
                    }
                    
                    MovieSectionView(movies: movieListViewModel.movies)
                    
                    Divider()
                        .padding(.bottom)
                }
            }
        }
    }
    
    struct SelectionHeaderView<Destination>: View where Destination: View {
        let title: String
        let destination: ()-> Destination
        
        init(title: String, @ViewBuilder destination: @escaping () -> Destination) {
            self.title = title
            self.destination = destination
        }
        
        var body: some View {
            HStack {
                Text(title)
                    .font(.title2)
                
                Spacer()
                
                NavigationLink(destination: destination){
                    HStack {
                        Text("See all")
                        
                        Image(systemName: "chevron.right")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SearchAllListView(albumListViewModel: AlbumListViewModel.example(), songListViewModel: SongListViewModel.example(), movieListViewModel: MovieListViewModel.example())
}