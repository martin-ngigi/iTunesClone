//
//  SongListView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct SongListView: View {
    
    @StateObject var viewModel: SongListViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.songs) { song in
                NavigationLink{
                    SongRowView(song: song)
                } label: {
                    SongRowView(song: song)
                }
            }
            
            ListPlaceholderRowView(state: viewModel.state, loadMore: viewModel.loadMore)
        }
        .listStyle(.plain)
    }
}

#Preview {
    SongListView(viewModel: SongListViewModel.example())
}
