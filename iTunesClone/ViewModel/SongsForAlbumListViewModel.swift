//
//  SongsForAlbumListViewModel.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 11/03/2024.
//

import Foundation

class SongsForAlbumListViewModel: ObservableObject {
    let albumID: Int
    @Published var songs = [Song]()
    @Published var state: FetchState = .good
    
    private let service = APIService()
    
    init(albumID: Int) {
        self.albumID = albumID
        print("init for songs for album \(albumID)")
    }
    
    func fetch(){
        fetchSongs(for: albumID)
    }
    
    private func fetchSongs(for albumID: Int){
        service.fetchSongs(for: albumID) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    var songs = results.results
                    if results.resultCount > 0 {
                        _ = songs.removeFirst()
                    }
                    
                    self?.songs = songs
                    self?.state = .good
                    
                    print("DEBUG: fetchSongs success \(results.resultCount)")
                case .failure(let error):
                    print("Couldn't load songs with error: \(error.localizedDescription)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    static func example() -> SongsForAlbumListViewModel{
        let vm = SongsForAlbumListViewModel(albumID: 1)
        vm.songs = [Song.example(), Song.example2()]
        return vm
    }
}
