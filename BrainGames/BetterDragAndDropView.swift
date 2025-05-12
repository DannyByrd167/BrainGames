//
//  BetterDragAndDropView.swift
//  BrainGames
//
//  Created by Danny Byrd on 5/11/25.
//

import SwiftUI

struct BetterDragAndDropView: View {
    let squareDivisor: CGFloat
    let grid: [GridSquare]
    var shapes = GridFillGridsTest()
    
    var body: some View {
        GeometryReader { proxy in
            let squareSize = proxy.size.width / squareDivisor
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.purple)
                    .frame(height: 50)
                
                GeometryReader { gridProxy in
                    Color.red
                    
                    //TODO: Change to allow variable size grids
                    let gridStartPosition = CGPoint(x: (gridProxy.size.width / 2) - 2 * squareSize, y: squareSize / 2)
                    
                    ForEach(grid, id: \.id) { square in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .frame(width: squareSize, height: squareSize)
                            .position(x: gridStartPosition.x + squareSize * square.relativePosition.x, y: gridStartPosition.y + squareSize * square.relativePosition.y)
                    }
                }
                
                GeometryReader { shapesProxy in
                    let shapeSquareSize = squareSize / 3
                    
                    Color.gray
                    
                    ForEach(Array(shapes.grid.enumerated()), id: \.element.id) { i, shape in
                        
                        let shapePosition =  CGPoint(x: shapeWidthProportion(
                            proxy: shapesProxy,
                            i: i,
                            squareSize: shapeSquareSize
                        ), y: shapeHeightProportion(proxy: shapesProxy, i: i, squareSize: shapeSquareSize))
                        
//                        BetterGridShapeView(shape: shape, startPosition: shapePosition, squareSize: shapeSquareSize)
                        
                        ForEach(shape.shapeCoordinates, id: \.self) { square in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(shape.color)
                                .frame(width: shapeSquareSize, height: shapeSquareSize)
                                .position(
                                    x: shapeWidthProportion(
                                        proxy: shapesProxy,
                                        i: i,
                                        squareSize: shapeSquareSize
                                    ) + shapeSquareSize * square.x,
                                    y: shapeHeightProportion(
                                        proxy: shapesProxy,
                                        i: i,
                                        squareSize: shapeSquareSize
                                    ) + shapeSquareSize * square.y
                                )
                        }
                    }
                }
                
            }
        }
    }
    
    func shapeWidthProportion(proxy: GeometryProxy, i: Int, squareSize: CGFloat) -> CGFloat {
        let thirdOfWidth = proxy.size.width / 3
        return (CGFloat((i % 3))) * thirdOfWidth + squareSize
    }
    
    func shapeHeightProportion(proxy: GeometryProxy, i: Int, squareSize: CGFloat) -> CGFloat {
        let thirdOfHeight = proxy.size.height / 3
        // 0->2: top third, 3->5: mid third, 6->8: bottom third
        let correctedIndex = i / 3
        return CGFloat(correctedIndex) * thirdOfHeight + squareSize
    }
}

#Preview {
    let grid: [GridSquare] = [
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
    ]
    
    BetterDragAndDropView(squareDivisor: 6, grid: grid)
}
