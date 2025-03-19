//
//  ColorMatch.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/18/25.
//

import SwiftUI

struct ColorMatchView: View {
    @State var difference = 0.3
    @State var colorsData = ViewModel.randomColors(difference: 0.3)
    @State var score: Int = 0
    @State var totalGuesses: Int = 0
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                colorsData.commonColor.mix(with: .white, by: 0.8)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("\(score)/\(totalGuesses)")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                    
                    Spacer()
                    
                    LazyVGrid(columns: Array.init(repeating: .init(.fixed(proxy.size.width / 6)), count: 5)) {
                        ForEach(0..<20) { index in
                            Button {
                                var isIncreasingDifficulty = false
                                if colorsData.colors[index] == colorsData.oddColor {
                                    score += 1
                                    if score % 5 == 0 {
                                        isIncreasingDifficulty = true
                                    }
                                    resetColors(increasingDifficulty: isIncreasingDifficulty)
                                }
                                totalGuesses += 1
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(colorsData.colors[index])
                                    .frame(width: proxy.size.width / 6, height: proxy.size.width / 6)
                                
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Spacer()
                }
            }
        }
    }
    
    func resetColors(increasingDifficulty: Bool) {
        if increasingDifficulty {
            difference -= 0.05
        }
        
        if difference <= 0 {
            print("Finished game")
            return
        }
        
        colorsData = ViewModel.randomColors(difference: difference)
    }
}

#Preview {
    ColorMatchView()
}
