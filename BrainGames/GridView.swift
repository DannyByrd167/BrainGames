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
    var color = Color.gray.opacity(0.2)
    var shapeColor = Color.white
    var relativePosition: CGPoint
}

struct GridView: View {
    @Binding var selectedGame: BrainGame?
    
    @State var grid: [CGPoint: GridSquare] = {
        var tempGrid: [CGPoint: GridSquare] = [:]
        for x in 0..<5 {
            for y in 0..<5 {
                tempGrid[.init(x: x, y: y)] = .init(relativePosition: .init(x: x, y: y))
            }
        }
        
        return tempGrid
    }()
    
    @State var shapes: [GridShape] = GridFillGrids.shapes.randomElement()!
    
    var body: some View {
        GeometryReader { proxy in
            let initialPosition: CGPoint = .init(x: proxy.size.width / 6, y: proxy.size.width * 0.15 + proxy.safeAreaInsets.bottom)
            let squareSize = proxy.size.width / 6
            
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                ForEach(Array(grid.values), id: \.id) { value in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(value.color)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(.white, lineWidth: 1)
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
                                    withAnimation(.easeIn) {
                                        shape.size = squareSize
                                    }
                                } else {
                                    withAnimation {
                                        shape.size = squareSize / 3
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
                            
                            if checkGridFilled() {
                                for shape in shapes {
                                    withAnimation {
                                        shape.size *= 1.1
                                    } completion: {
                                        withAnimation {
                                            shape.position = .init(x: proxy.size.width / 2, y: proxy.size.width / 2)
                                            shape.size = 0
                                        }
                                    }
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now().advanced(by: .seconds(1))) {
                                    var tempGrid: [CGPoint: GridSquare] = [:]
                                    for x in 0..<5 {
                                        for y in 0..<5 {
                                            tempGrid[.init(x: x, y: y)] = .init(relativePosition: .init(x: x, y: y))
                                        }
                                    }
                                    grid = tempGrid
                                    shapes = GridFillGrids.shapes.randomElement()!
                                    updateShapesToMatchGeometryReader(proxy: proxy)
                                    

                                }
                            }
                        }
                        .zIndex(shape.isSelected ? 1.0 : 0.0)
                }
                
                Button {
                    selectedGame = .none
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .font(.title)
                }
                .position(x: proxy.size.width * 0.05, y: proxy.size.height * 0.02)
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
    
    func checkGridFilled() -> Bool {
        guard !shapes.isEmpty else {
            return false
        }
        
        var isGridCorrect = true
        for shape in shapes {
            if !shape.isInGrid {
                isGridCorrect = false
                break
            }
        }
        
        return isGridCorrect
    }
    
    func updateShapesToMatchGeometryReader(proxy: GeometryProxy) {
        var i = 1
        
        for shape in shapes {
            var heightProportion: CGFloat {
                if i < 4 {
                    return 18/32
                } else if i < 7 {
                    return 23/32
                } else {
                    return 28/32
                }
            }
            var widthProportion: CGFloat {
                if i % 3 == 0 {
                    return 2 / 25
                } else if i % 3 == 1 {
                    return 10 / 25
                } else  {
                    return 18 / 25
                }
            }
            shape.size = proxy.size.width / 18
            shape.position = .init(x: (proxy.size.width * widthProportion), y: proxy.size.height * heightProportion)
            shape.anchorPoint = .init(x: (proxy.size.width * widthProportion), y: proxy.size.height * heightProportion)

            i += 1
        }
    }
}

#Preview {
    GridView(selectedGame: .constant(.gridFill))
}
