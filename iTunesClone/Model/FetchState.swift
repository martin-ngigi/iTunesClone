//
//  FetchState.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case noResults
    case error(String)
}


