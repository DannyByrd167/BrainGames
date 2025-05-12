//
//  GridShape.swift
//  BrainGames
//
//  Created by Danny Byrd on 5/12/25.
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
