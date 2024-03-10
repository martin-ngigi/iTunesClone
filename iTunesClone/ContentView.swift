//
//  ContentView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            AlbumSearchView()
                .tabItem {
                    Label("Albums", systemImage: "music.note")
                }
            
            MovieSearchView()
                .tabItem {
                    Label("Movies", systemImage: "tv")
                }
        }
    }
}

#Preview {
    ContentView()
}
