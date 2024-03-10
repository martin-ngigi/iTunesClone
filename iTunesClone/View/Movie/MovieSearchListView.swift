//
//  MovieSearchView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct MovieSearchListView: View {
    
    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                }
                else {
                    MovieListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search movies")
        }
    }
}

#Preview {
    MovieSearchListView()
}
