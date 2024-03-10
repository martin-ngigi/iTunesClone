//
//  SearchPlaceholderView.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct SearchPlaceholderView: View {
    
    @Binding var searchTerm: String
    let suggestions = ["rammstein", "cry to me", "maneskin"]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Trending")
                .font(.title)
            ForEach(suggestions, id: \.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text)
                        .font(.title2)
                }
            }
        }
    }
}


#Preview {
    SearchPlaceholderView(searchTerm: .constant("John"))
}
