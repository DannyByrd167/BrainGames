//
//  GameTileView.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/30/25.
//

import SwiftUI

struct GameTileView: View {
    let game: BrainGame
    var body: some View {
        VStack {
            switch game {
            case .gridFill:
                Image(systemName: "square.grid.3x3.topleft.filled")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
            case .reactionTime:
                Image(systemName: "timer")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
            case .colorMatch:
                Image(systemName: "paintpalette")
                    
            }
            
            Text(game.rawValue)
                .font(.title2)
        }
        .font(.largeTitle)
        .foregroundStyle(.black)
    }
}

