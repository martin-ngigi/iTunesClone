//
//  BuyButtonStyle.swift
//  iTunesClone
//
//  Created by Martin Wainaina on 10/03/2024.
//

import SwiftUI

struct BuyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.accentColor, lineWidth: 1))
            .opacity(configuration.isPressed ? 0.5 : 1)
        
    }
}

//#Preview {
//    BuyButtonStyle()
//}
