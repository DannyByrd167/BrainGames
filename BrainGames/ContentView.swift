//
//  ContentView.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/18/25.
//

import SwiftUI


struct ContentView: View {
    var levelText: String {
        let currentLevel = UserDefaults.standard.integer(forKey: "currentLevel")
        if currentLevel != 0 {
            return "Current Level: \(currentLevel)"
        } else {
            return "Play your first level!"
        }
    }
    var streakText: String {
        let currentStreak = UserDefaults.standard.integer(forKey: "currentStreak")
        
        if currentStreak != 0 {
            return "Current Streak: \(currentStreak)🔥"
        } else {
            return "New Challenge Every Day!"
        }
    }
    var timeRecordText: String {
        let timeRecord = UserDefaults.standard.integer(forKey: "timeRecord")
        
        if timeRecord != 0 {
            return "Current Record: \(timeRecord / 60): \(timeRecord % 60)"
        } else {
            return "Race against the clock!"
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Grid Fill")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
            
                    NavigationLink {
                        BetterDragAndDropView(squareDivisor: 6, grid: [
                            GridSquare(relativePosition: CGPoint(x: 0, y: 0)),
                            GridSquare(relativePosition: CGPoint(x: 1, y: 0)),
                            GridSquare(relativePosition: CGPoint(x: 2, y: 0)),
                            GridSquare(relativePosition: CGPoint(x: 3, y: 0)),
                            GridSquare(relativePosition: CGPoint(x: 4, y: 0)),
                            
                            GridSquare(relativePosition: CGPoint(x: 0, y: 1)),
                            GridSquare(relativePosition: CGPoint(x: 1, y: 1)),
                            GridSquare(relativePosition: CGPoint(x: 2, y: 1)),
                            GridSquare(relativePosition: CGPoint(x: 3, y: 1)),
                            GridSquare(relativePosition: CGPoint(x: 4, y: 1)),
                            
                            GridSquare(relativePosition: CGPoint(x: 0, y: 2)),
                            GridSquare(relativePosition: CGPoint(x: 1, y: 2)),
                            GridSquare(relativePosition: CGPoint(x: 2, y: 2)),
                            GridSquare(relativePosition: CGPoint(x: 3, y: 2)),
                            GridSquare(relativePosition: CGPoint(x: 4, y: 2)),
                            
                            GridSquare(relativePosition: CGPoint(x: 0, y: 3)),
                            GridSquare(relativePosition: CGPoint(x: 1, y: 3)),
                            GridSquare(relativePosition: CGPoint(x: 2, y: 3)),
                            GridSquare(relativePosition: CGPoint(x: 3, y: 3)),
                            GridSquare(relativePosition: CGPoint(x: 4, y: 3)),
                            
                            GridSquare(relativePosition: CGPoint(x: 0, y: 4)),
                            GridSquare(relativePosition: CGPoint(x: 1, y: 4)),
                            GridSquare(relativePosition: CGPoint(x: 2, y: 4)),
                            GridSquare(relativePosition: CGPoint(x: 3, y: 4)),
                            GridSquare(relativePosition: CGPoint(x: 4, y: 4)),
                        ])
                            .navigationBarBackButtonHidden()
                    } label: {
                        GameModeNavigationView(title: "DAILY CHALLENGE", subtext: streakText, bgColor: .yellow.mix(with: .black, by: 0.1), fontColor: .white)
                    }
                    .padding()

                    NavigationLink {
                        GridView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        GameModeNavigationView(title: "CLASSIC MODE", subtext: levelText, bgColor: .blue, fontColor: .white)
                    }
                    .padding()

                    NavigationLink {
                        Color.white
                    } label: {
                        GameModeNavigationView(title: "TIMED MODE", subtext: timeRecordText, bgColor: .red, fontColor: .white)
                    }
                    .padding()
                }

            }
        }
    }
}

#Preview {
    ContentView()
}


struct GameModeNavigationView: View {
    let title: String
    let subtext: String
    let bgColor: Color
    let fontColor: Color
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundStyle(fontColor)
                .font(.system(size: 25, weight: .bold, design: .rounded))
            Text(subtext)
                .foregroundStyle(fontColor.secondary)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
        }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(bgColor)
            )
    }
}
