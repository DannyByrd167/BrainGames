//
//  ColorMatchVM.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/18/25.
//

import Foundation
import SwiftUI

extension ColorMatchView {
    @Observable
    class ViewModel {
        static func randomColors(difference: Double) -> (colors: [Color], commonColor: Color, oddColor: Color) {
            let hue = Double.random(in: 0...1)
            let saturation = 0.8
            let brightness = 0.8
            let first = Color(hue: hue, saturation: saturation, brightness: brightness)
            
            var correctDistance = difference
            if difference > 1 || difference < -1 {
                correctDistance = 1 / difference
            }
            
            let secondSaturation = saturation + correctDistance > 1 ? saturation + correctDistance : saturation - correctDistance
            let secondBrightness = brightness + correctDistance > 1 ? brightness + correctDistance : brightness - correctDistance
            let second = Color(hue: hue, saturation: secondSaturation, brightness: secondBrightness)
        
            var colorArray = Array.init(repeating: first, count: 20)
            let index = Int.random(in: 0...19)
            colorArray[index] = second
            
            return (colorArray, first, second)
        }
    }
}
