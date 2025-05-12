//
//  BetterGridShapeView.swift
//  BrainGames
//
//  Created by Danny Byrd on 5/12/25.
//

import SwiftUI

struct BetterGridShapeView: View {
    @State var shape: BetterGridShape
    let startPosition: CGPoint
    let squareSize: CGFloat
    
    var body: some View {
        ZStack {
            ForEach(shape.shapeCoordinates, id: \.self) { square in
                RoundedRectangle(cornerRadius: shape.size / 5)
                    .fill(shape.color)
                    .frame(width: shape.size, height: shape.size)
                    .position(x: shape.position.x + shape.size * square.x, y: shape.position.y + shape.size * square.y)
            }
        }
        .onAppear {
            shape.place(at: startPosition, size: squareSize, color: .red)
        }
    }
}

#Preview {
    BetterGridShapeView(shape: .init(shapeCoordinates: [
        .init(x: 0, y: 0),
        .init(x: 1, y: 0),
        .init(x: 0, y: 1)
    ]), startPosition: .init(x: 100, y: 100), squareSize: 30)
}
