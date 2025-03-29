//
//  ContentView.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Color match") {
                    ColorMatchView()
                }
                
                NavigationLink("Reaction time") {
                    ReactionTimeView()
                }
                
                NavigationLink("Grid fill") {
                    GridView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
