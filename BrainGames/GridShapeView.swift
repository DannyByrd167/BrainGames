//
//  GridShapeView.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/25/25.
//

import SwiftUI

@Observable
class GridShape: Identifiable {
    let id = UUID()
    var shapeCoordinates: [CGPoint]
    var position: CGPoint
    var lastPosition: CGPoint
    var anchorPoint: CGPoint = .zero
    var color: Color
    var size: CGFloat
    var isSelected = false
    var offset: CGSize = .zero
    var isInGrid = false

    
    init(shapeCoordinates: [CGPoint], position: CGPoint, color: Color, size: CGFloat) {
        self.shapeCoordinates = shapeCoordinates
        self.position = position
        lastPosition = position
        self.color = color
        self.size = size
    }
}


struct GridShapeView: View {
    @Binding var gridShape: GridShape
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(gridShape.shapeCoordinates, id: \.hashValue) { square in
                    ZStack {
                        RoundedRectangle(cornerRadius: gridShape.size / 5)
                            .position(gridShape.position + CGPoint(x: CGFloat(square.x) * (gridShape.size), y: CGFloat(square.y) * gridShape.size))
                            .offset(gridShape.offset)
                        
                        RoundedRectangle(cornerRadius: gridShape.size / 5)
                            .strokeBorder(.white)
                            .position(gridShape.position + CGPoint(x: CGFloat(square.x) * (gridShape.size), y: CGFloat(square.y) * gridShape.size))
                            .offset(gridShape.offset)
                    }
                }
                .foregroundStyle(gridShape.color)
                .frame(width: gridShape.size, height: gridShape.size)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            if !gridShape.isSelected {
                                gridShape.isSelected = true
                            }
                            
                            gridShape.offset = value.translation
                        })
                        .onEnded({ value in
                            gridShape.isSelected = false
                            
                            gridShape.lastPosition = gridShape.position + .init(x: gridShape.offset.width, y: gridShape.offset.height)
                            gridShape.offset = .zero
                            
                        })
                )
            }
        }
    }
}

#Preview {
    GridShapeView(gridShape: .constant(.init(shapeCoordinates: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1)], position: .init(x: 0, y: 0), color: .blue, size: 30)))
}
