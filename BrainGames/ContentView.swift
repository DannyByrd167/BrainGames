//
//  ContentView.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/18/25.
//

import SwiftUI

enum BrainGame: String {
    case colorMatch = "Color Match"
    case reactionTime = "Reaction Time"
    case gridFill = "Grid Fill"
}

struct ContentView: View {
    @State var selectedGame: BrainGame? = nil
    let games: [BrainGame] = [.colorMatch, .reactionTime, .gridFill]
    
    var body: some View {
        
        switch selectedGame {
        case .none:
            GeometryReader { proxy in
                ZStack {
                    Color.gray
                        .ignoresSafeArea()
                    VStack {
                        Text("Brain Games")
                            .foregroundStyle(.black)
                            .font(.largeTitle)
                        
                        LazyVGrid(columns: [.init(), .init()]) {
                            ForEach(games, id: \.self) { game in
                                Button {
                                    selectedGame = game
                                } label: {
                                    GameTileView(game: game)
                                        .padding()
                                        .background (
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.blue)
                                                .frame(width: proxy.size.width / 2 - 20)
                                        )
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
        case .colorMatch:
            ColorMatchView(selectedGame: $selectedGame)
        case .reactionTime:
            ReactionTimeView(selectedGame: $selectedGame)
        case .gridFill:
            GridView(selectedGame: $selectedGame)
        }
    }
}

#Preview {
    ContentView()
}
