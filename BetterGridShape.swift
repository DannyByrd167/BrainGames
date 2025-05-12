//
//  BetterGridShape.swift
//  BrainGames
//
//  Created by Danny Byrd on 5/12/25.
//

import SwiftUI

@Observable
class BetterGridShape: Identifiable {
    let id = UUID()
    var shapeCoordinates: [CGPoint]
    var position: CGPoint = .zero
    var lastPosition: CGPoint = .zero
    var anchorPoint: CGPoint = .zero
    var color: Color = .clear
    var size: CGFloat = 0
    var isSelected = false
    var offset: CGSize = .zero
    var isInGrid = false

    
    init(shapeCoordinates: [CGPoint]) {
        self.shapeCoordinates = shapeCoordinates
    }
    
    func place(at position: CGPoint, size: CGFloat, color: Color) {
        self.position = position
        self.size = size
        self.color = color
        lastPosition = position
        anchorPoint = position
    }
}
