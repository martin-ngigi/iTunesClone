//
//  SongListViewModel.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import Foundation
import Combine

class SongListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var songs: [Song] = [Song]()
    @Published var state: FetchState = .good
    
    private var service = APIService()
    
    let limit: Int = 20
    var page: Int = 0
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink{ [weak self] term in
                self?.clear()
                self?.fetchSongs(for: term)
            }.store(in: &subscriptions)
    }
    
    func clear(){
        state = .good
        songs = []
        page = 0
    }
    
    func loadMore() {
        fetchSongs(for: searchTerm)
    }
    
    func fetchSongs(for searchTerm: String){
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }
        
        service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit) {  [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    for songs in results.results {
                        self?.songs.append(songs)
                    }
                    self?.page += 1
                    self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                    print("DEBUG: fetchSongs fecthed all songs successfully \(results.resultCount)")
                case .failure(let error):
                    print("DEBUG: fetchSongs could not load songs with error \(error.localizedDescription)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    static func example() -> SongListViewModel {
        let vm = SongListViewModel()
        vm.songs = [Song.example()]
        return vm
    }
}
