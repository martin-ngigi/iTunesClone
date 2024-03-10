//
//  MovieListView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel : MovieListViewModel
    var body: some View {
        List {
            ForEach(viewModel.movies) { movie in
                MovieRowView(movie: movie)
            }
            
            ListPlaceholderRowView(state: viewModel.state, loadMore: viewModel.loadMore)
        }
        .listStyle(.plain)
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel())
}
