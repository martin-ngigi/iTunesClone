//
//  AlbumDetailView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 11/03/2024.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    
    @StateObject var songsViewModel: SongsForAlbumListViewModel
    
    init(album: Album) {
        print("init album detail \(album.id)")
        self.album = album
        self._songsViewModel = StateObject(wrappedValue: SongsForAlbumListViewModel(albumID: album.id))
    }
    var body: some View {
        VStack {
            AlbumHeaderDetailView(album: album)
            
            SongsForAlbumListView(songsViewModel: songsViewModel, selectedSong: nil)
            
        }
        .onAppear{
            songsViewModel.fetch()
        }
    }
}

struct AlbumHeaderDetailView: View {
    
    let album: Album
    
    var body: some View {
        HStack(alignment: .bottom){
            ImageLoadingView(urlString: album.artworkUrl100, size: 100)
            
            VStack(alignment: .leading){
                Text(album.collectionName)
                    .font(.footnote)
                    .foregroundStyle(Color(.label))
                
                Text(album.artistName)
                    .padding(.bottom, 5)
                
                Text(album.primaryGenreName)
                
                Text("\(album.trackCount) songs")
                
                Text("Released \(formattedDate(value: album.releaseDate))")
                
            }
            .font(.caption)
            .foregroundStyle(.gray)
            .lineLimit(1)
            
            
            Spacer(minLength: 20)
            
            BuyButton(urlString: album.collectionViewURL, price: album.collectionPrice, currency: album.currency)
        }
        .padding()
        .background(
            Color(.systemBackground)
                .ignoresSafeArea(.all)
                .shadow(radius: 5)
        )
        
    }
    
                     
    func formattedDate(value: String) -> String {
        let dateFormatterGetter = DateFormatter() // "2012-01-01T08:00:00Z"
                    
        guard let date  = dateFormatterGetter.date(from: value) else {
            return ""
        }
                    
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale.current
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        
        return dateformatter.string(from: date)
    }
                     
                   
                     
}

#Preview {
    AlbumDetailView(album: Album.example())
}
