//
//  AlbumForSongViewModel.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 11/03/2024.
//

import Foundation


class AlbumForSongViewModel: ObservableObject{
    @Published var album: Album?
    @Published var state: FetchState = .good
    
    let service = APIService()
    
    func fetch(song: Song){
        let albumID = song.collectionID
        
        service.fetchAlbum(with: albumID) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    let albums = results.results
                    self?.album = albums.first
                    self?.state = .good
                    print("DEBUG: fetch song successfully: \(results.resultCount)")
                case .failure(let error):
                    print("Could not load song with error: \(error.localizedDescription)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
