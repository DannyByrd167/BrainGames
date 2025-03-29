//
//  GridView.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/25/25.
//

import SwiftUI
import CoreGraphics


extension CGPoint {
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func * (lhs: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x * scalar, y: lhs.y * scalar)
    }
}

struct GridSquare: Identifiable {
    let id = UUID()
    var color = Color.white
    var shapeColor = Color.white
    var relativePosition: CGPoint
}

struct GridView: View {
    @State var grid: [CGPoint: GridSquare] = {
        var tempGrid: [CGPoint: GridSquare] = [:]
        for x in 0..<5 {
            for y in 0..<5 {
                tempGrid[.init(x: x, y: y)] = .init(relativePosition: .init(x: x, y: y))
            }
        }
        
        return tempGrid
    }()
    
    @State var shapes: [GridShape] = {
        var currGrid = GridFillGrids.grids.randomElement()!.shuffled()
        var temp = [GridShape]()
        for (k,v) in currGrid {
            temp.append(
                .init(
                    shapeCoordinates: v,
                    position: .zero,
                    color: .init(
                        red: Double.random(in: 0...1),
                        green: Double.random(in: 0...1),
                        blue: Double.random(in: 0...1)
                    ),
                    size: 30
                )
            )
        }
        return temp
    }()
    
    var body: some View {
        GeometryReader { proxy in
            let initialPosition: CGPoint = .init(x: proxy.size.width / 6, y: 0 + proxy.safeAreaInsets.bottom)
            let squareSize = proxy.size.width / 6
            
            ZStack {
                ForEach(Array(grid.values), id: \.id) { value in
                    ZStack {
                        Rectangle()
                            .fill(value.color)
                        
                        Rectangle()
                            .strokeBorder(.black, lineWidth: 1)
                    }
                    .frame(width: squareSize, height: squareSize)
                    .position(initialPosition + (value.relativePosition * squareSize))
                }
                
                ForEach($shapes, id: \.color) { $shape in
                    GridShapeView(gridShape: $shape)
                        .onChange(of: shape.isSelected) { _, isSelected in
                            if !isSelected {
                                matchShapeToGrid(shape: &shape, squareSize: squareSize, initialPosition: initialPosition)
                                if shape.isInGrid {
                                    withAnimation {
                                        shape.size = squareSize
                                    }
                                } else {
                                    withAnimation {
                                        shape.size = squareSize / 2
                                    }
                                }
                            } else {
                                withAnimation {
                                    shape.size = squareSize
                                }
                                
                                for value in grid.values {
                                    if value.shapeColor == shape.color {
                                        grid[value.relativePosition]!.shapeColor = .white
                                    }
                                }
                            }
                        }
                        .zIndex(shape.isSelected ? 1.0 : 0.0)
                }
                
                Button("New Grid") {
                    shapes = GridFillGrids.shapes.randomElement()!
                    updateShapesToMatchGeometryReader(proxy: proxy)
                    var tempGrid: [CGPoint: GridSquare] = [:]
                    for x in 0..<5 {
                        for y in 0..<5 {
                            tempGrid[.init(x: x, y: y)] = .init(relativePosition: .init(x: x, y: y))
                        }
                    }
                    grid = tempGrid
                }
                .position(x: proxy.size.width / 2, y: proxy.size.height)
                .buttonStyle(.bordered)
            }
            .onAppear {
                updateShapesToMatchGeometryReader(proxy: proxy)
            }
        }
    }
    
    func matchShapeToGrid(shape: inout GridShape, squareSize: CGFloat, initialPosition: CGPoint) {
        var matchedPoint: CGPoint?
        var matchedGridCoord: CGPoint?
        let diff = squareSize / 2
        let position = shape.lastPosition
        let negativePostion = position * -1
        for value in grid.values {
            let gridPosition = initialPosition + (value.relativePosition * squareSize)
            let positionsDiff = gridPosition + negativePostion
            if abs(positionsDiff.y) < diff && abs(positionsDiff.x) < diff {
                matchedPoint = gridPosition
                matchedGridCoord = value.relativePosition
                break
            }
        }
        
        guard let matchedPoint, let matchedGridCoord else {
            shape.position = shape.anchorPoint
            shape.isInGrid = false
            return
        }
        
    
        var isValidShape = true
        for coordinate in shape.shapeCoordinates {
            let matchedGridToShapeCoord = matchedGridCoord + coordinate
            guard let gridSquareCoord = grid[matchedGridToShapeCoord] else {
                isValidShape = false
                break
            }
            
            if gridSquareCoord.shapeColor != .white && gridSquareCoord.shapeColor != shape.color {
                isValidShape = false
                break
            }
        }
        
        guard isValidShape else {
            shape.isInGrid = false
            shape.position = shape.anchorPoint
            return
        }
        
        shape.isInGrid = true
        shape.position = matchedPoint
        for coordinate in shape.shapeCoordinates {
            let matchedGridToShapeCoord = matchedGridCoord + coordinate
            grid[matchedGridToShapeCoord]?.shapeColor = shape.color
        }
    }
    
    func updateShapesToMatchGeometryReader(proxy: GeometryProxy) {
        var i = 1
        
        for shape in shapes {
            var heightProportion: CGFloat {
                if i > 4 {
                    return 1/2
                } else if i > 2 {
                    return 6/9
                } else  {
                    return 8 / 9
                }
            }
            let widthProportion = CGFloat((i % 3))
            shape.size = proxy.size.width / 6 / 3
            shape.position = .init(x: proxy.size.width / 6 + (proxy.size.width * widthProportion / 3), y: proxy.size.height * heightProportion)
            shape.anchorPoint = .init(x: (proxy.size.width * widthProportion / 5), y: proxy.size.height * heightProportion)

            i += 1
        }
    }
}

#Preview {
    GridView()
}
