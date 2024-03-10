//
//  AlbumListView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct AlbumListView: View {
    @ObservedObject var viewModel: AlbumListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.albums) { album in
                AlbumRowView(album: album)

            }
            
            ListPlaceholderRowView(state: viewModel.state,
                                   loadMore: viewModel.loadMore)
        }
        .listStyle(.plain)
    }
}

#Preview {
    AlbumListView(viewModel: AlbumListViewModel.example())
}
