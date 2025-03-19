//
//  ReactionTime.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/18/25.
//

import SwiftUI

enum ReactionTimeGameState {
    case beforeStart, reacting, reactionPressed, waitingForGreen
}

struct ReactionTimeView: View {
    @State var bgColor = Color.blue
    @State var gameState: ReactionTimeGameState = .beforeStart
    @State var reactionTimer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
    @State var randomSwitchToGreenTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var randomSwitchToGreenSecondsPassed = 0
    @State var randomSwitchToGreenSecondsNeeded = Int.random(in: 3...12)
    @State var reactionTime = 0
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            
            VStack {
                if gameState == .beforeStart {
                    Button {
                        startTimer()
                    } label: {
                        Text("Start")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.cyan)
                            )
                    }
                }
                
                if gameState == .waitingForGreen {
                    Text("Wait for green")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
                
                if gameState == .reacting {
                    Text("Press Anywhere")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
                
                if gameState == .reactionPressed {
                    Spacer()
                    
                    Text("Your Reaction Time:")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text("\(reactionTime) ms")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button {
                       resetGameState()
                    } label: {
                        Text("Play again")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.cyan)
                            )
                    }
                    
                    Spacer()
                }
            }
        }
        .onReceive(reactionTimer) { _ in
            if gameState == .reacting {
                reactionTime += 1
            }
        }
        .onReceive(randomSwitchToGreenTimer) { time in
            if gameState == .waitingForGreen {
                randomSwitchToGreenSecondsPassed += 1
                if randomSwitchToGreenSecondsPassed == randomSwitchToGreenSecondsNeeded {
                    bgColor = .green
                    gameState = .reacting
                }
            }
        }
        .onTapGesture {
            if gameState == .waitingForGreen {
                gameState = .reactionPressed
                bgColor = .blue
                reactionTime = -1
            }
            
            if gameState == .reacting {
                gameState = .reactionPressed
                bgColor = .blue
            }
        }
    }
    
    func startTimer() {
        reactionTimer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
        //start
        gameState = .waitingForGreen
        bgColor = .red
    }
    
    func resetGameState() {
        bgColor = Color.blue
        gameState = .beforeStart
        randomSwitchToGreenSecondsPassed = 0
        randomSwitchToGreenSecondsNeeded = Int.random(in: 3...12)
        reactionTime = 0
    }
}

#Preview {
    ReactionTimeView()
}
