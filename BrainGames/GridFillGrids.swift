//
//  GridFillGrids.swift
//  BrainGames
//
//  Created by Danny Byrd on 3/28/25.
//

import Foundation
import SwiftUI

@Observable
class GridFillGridsTest {
    var grid: [GridShape] = [
//        .init(
//            shapeCoordinates: [
//                    .init(x: 0, y: 0),
//                    .init(x: 1, y: 0),
//                    .init(x: 2, y: 0),
//                    .init(x: 3, y: 0),
//                    .init(x: 4, y: 0),
//                    .init(x: 0, y: 1),
//                    .init(x: 1, y: 1),
//                    .init(x: 2, y: 1),
//                    .init(x: 3, y: 1),
//                    .init(x: 4, y: 1),
//                    .init(x: 0, y: 2),
//                    .init(x: 1, y: 2),
//                    .init(x: 2, y: 2),
//                    .init(x: 3, y: 2),
//                    .init(x: 4, y: 2),
//                    .init(x: 0, y: 3),
//                    .init(x: 1, y: 3),
//                    .init(x: 2, y: 3),
//                    .init(x: 3, y: 3),
//                    .init(x: 4, y: 3),
//                    .init(x: 0, y: 4),
//                    .init(x: 1, y: 4),
//                    .init(x: 2, y: 4),
//                    .init(x: 3, y: 4),
//                    .init(x: 4, y: 4),
//                    
//                              ],
//            position: .zero,
//            color: .init(hue: .random(in: 0...1), saturation: 0.8, brightness: 0.5),
//            size: 10),
//        .init(
//            shapeCoordinates: [
//                    .init(x: 0, y: 0),
//                    .init(x: 1, y: 0),
//                    .init(x: 2, y: 0),
//                    .init(x: 3, y: 0),
//                    .init(x: 4, y: 0),
//                    .init(x: 0, y: 1),
//                    .init(x: 1, y: 1),
//                    .init(x: 2, y: 1),
//                    .init(x: 3, y: 1),
//                    .init(x: 4, y: 1),
//                    .init(x: 0, y: 2),
//                    .init(x: 1, y: 2),
//                    .init(x: 2, y: 2),
//                    .init(x: 3, y: 2),
//                    .init(x: 4, y: 2),
//                    .init(x: 0, y: 3),
//                    .init(x: 1, y: 3),
//                    .init(x: 2, y: 3),
//                    .init(x: 3, y: 3),
//                    .init(x: 4, y: 3),
//                    .init(x: 0, y: 4),
//                    .init(x: 1, y: 4),
//                    .init(x: 2, y: 4),
//                    .init(x: 3, y: 4),
//                    .init(x: 4, y: 4),
//                    
//                              ],
//            position: .zero,
//            color: .init(hue: .random(in: 0...1), saturation: 0.8, brightness: 0.5),
//            size: 10),
//        .init(
//    shapeCoordinates: [
//            .init(x: 0, y: 0),
//            .init(x: 1, y: 0),
//            .init(x: 2, y: 0),
//            .init(x: 3, y: 0),
//            .init(x: 4, y: 0),
//            .init(x: 0, y: 1),
//            .init(x: 1, y: 1),
//            .init(x: 2, y: 1),
//            .init(x: 3, y: 1),
//            .init(x: 4, y: 1),
//            .init(x: 0, y: 2),
//            .init(x: 1, y: 2),
//            .init(x: 2, y: 2),
//            .init(x: 3, y: 2),
//            .init(x: 4, y: 2),
//            .init(x: 0, y: 3),
//            .init(x: 1, y: 3),
//            .init(x: 2, y: 3),
//            .init(x: 3, y: 3),
//            .init(x: 4, y: 3),
//            .init(x: 0, y: 4),
//            .init(x: 1, y: 4),
//            .init(x: 2, y: 4),
//            .init(x: 3, y: 4),
//            .init(x: 4, y: 4),
//            
//                      ],
//    position: .zero,
//    color: .init(hue: .random(in: 0...1), saturation: 0.8, brightness: 0.5),
//    size: 10),
//        .init(
//    shapeCoordinates: [
//            .init(x: 0, y: 0),
//            .init(x: 1, y: 0),
//            .init(x: 2, y: 0),
//            .init(x: 3, y: 0),
//            .init(x: 4, y: 0),
//            .init(x: 0, y: 1),
//            .init(x: 1, y: 1),
//            .init(x: 2, y: 1),
//            .init(x: 3, y: 1),
//            .init(x: 4, y: 1),
//            .init(x: 0, y: 2),
//            .init(x: 1, y: 2),
//            .init(x: 2, y: 2),
//            .init(x: 3, y: 2),
//            .init(x: 4, y: 2),
//            .init(x: 0, y: 3),
//            .init(x: 1, y: 3),
//            .init(x: 2, y: 3),
//            .init(x: 3, y: 3),
//            .init(x: 4, y: 3),
//            .init(x: 0, y: 4),
//            .init(x: 1, y: 4),
//            .init(x: 2, y: 4),
//            .init(x: 3, y: 4),
//            .init(x: 4, y: 4),
//            
//                      ],
//    position: .zero,
//    color: .init(hue: .random(in: 0...1), saturation: 0.8, brightness: 0.5),
//    size: 10),
//        .init(
//    shapeCoordinates: [
//            .init(x: 0, y: 0),
//            .init(x: 1, y: 0),
//            .init(x: 2, y: 0),
//            .init(x: 3, y: 0),
//            .init(x: 4, y: 0),
//            .init(x: 0, y: 1),
//            .init(x: 1, y: 1),
//            .init(x: 2, y: 1),
//            .init(x: 3, y: 1),
//            .init(x: 4, y: 1),
//            .init(x: 0, y: 2),
//            .init(x: 1, y: 2),
//            .init(x: 2, y: 2),
//            .init(x: 3, y: 2),
//            .init(x: 4, y: 2),
//            .init(x: 0, y: 3),
//            .init(x: 1, y: 3),
//            .init(x: 2, y: 3),
//            .init(x: 3, y: 3),
//            .init(x: 4, y: 3),
//            .init(x: 0, y: 4),
//            .init(x: 1, y: 4),
//            .init(x: 2, y: 4),
//            .init(x: 3, y: 4),
//            .init(x: 4, y: 4),
//            
//                      ],
//    position: .zero,
//    color: .init(hue: .random(in: 0...1), saturation: 0.8, brightness: 0.5),
//    size: 10),
//        .init(
//    shapeCoordinates: [
//            .init(x: 0, y: 0),
//            .init(x: 1, y: 0),
//            .init(x: 2, y: 0),
//            .init(x: 3, y: 0),
//            .init(x: 4, y: 0),
//            .init(x: 0, y: 1),
//            .init(x: 1, y: 1),
//            .init(x: 2, y: 1),
//            .init(x: 3, y: 1),
//            .init(x: 4, y: 1),
//            .init(x: 0, y: 2),
//            .init(x: 1, y: 2),
//            .init(x: 2, y: 2),
//            .init(x: 3, y: 2),
//            .init(x: 4, y: 2),
//            .init(x: 0, y: 3),
//            .init(x: 1, y: 3),
//            .init(x: 2, y: 3),
//            .init(x: 3, y: 3),
//            .init(x: 4, y: 3),
//            .init(x: 0, y: 4),
//            .init(x: 1, y: 4),
//            .init(x: 2, y: 4),
//            .init(x: 3, y: 4),
//            .init(x: 4, y: 4),
//            
//                      ],
//    position: .zero,
//    color: .init(hue: .random(in: 0...1), saturation: 0.8, brightness: 0.5),
//    size: 10),
//        .init(
//    shapeCoordinates: [
//            .init(x: 0, y: 0),
//            .init(x: 1, y: 0),
//            .init(x: 2, y: 0),
//            .init(x: 3, y: 0),
//            .init(x: 4, y: 0),
//            .init(x: 0, y: 1),
//            .init(x: 1, y: 1),
//            .init(x: 2, y: 1),
//            .init(x: 3, y: 1),
//            .init(x: 4, y: 1),
//            .init(x: 0, y: 2),
//            .init(x: 1, y: 2),
//            .init(x: 2, y: 2),
//            .init(x: 3, y: 2),
//            .init(x: 4, y: 2),
//            .init(x: 0, y: 3),
//            .init(x: 1, y: 3),
//            .init(x: 2, y: 3),
//            .init(x: 3, y: 3),
//            .init(x: 4, y: 3),
//            .init(x: 0, y: 4),
//            .init(x: 1, y: 4),
//            .init(x: 2, y: 4),
//            .init(x: 3, y: 4),
//            .init(x: 4, y: 4),
//            
//                      ],
//    position: .zero,
//    color: .init(hue: .random(in: 0...1), saturation: 0.8, brightness: 0.5),
//    size: 10),
//        .init(
//    shapeCoordinates: [
//            .init(x: 0, y: 0),
//            .init(x: 1, y: 0),
//            .init(x: 2, y: 0),
//            .init(x: 3, y: 0),
//            .init(x: 4, y: 0),
//            .init(x: 0, y: 1),
//            .init(x: 1, y: 1),
//            .init(x: 2, y: 1),
//            .init(x: 3, y: 1),
//            .init(x: 4, y: 1),
//            .init(x: 0, y: 2),
//            .init(x: 1, y: 2),
//            .init(x: 2, y: 2),
//            .init(x: 3, y: 2),
//            .init(x: 4, y: 2),
//            .init(x: 0, y: 3),
//            .init(x: 1, y: 3),
//            .init(x: 2, y: 3),
//            .init(x: 3, y: 3),
//            .init(x: 4, y: 3),
//            .init(x: 0, y: 4),
//            .init(x: 1, y: 4),
//            .init(x: 2, y: 4),
//            .init(x: 3, y: 4),
//            .init(x: 4, y: 4),
//            
//                      ],
//    position: .zero,
//    color: .init(hue: .random(in: 0...1), saturation: 0.8, brightness: 0.5),
//    size: 10)
        ]
    
    private var fileHandle: FileHandle?
    
    init() {
        do {
            if let url = Bundle.main.url(forResource: "out", withExtension: "txt") {
                fileHandle = try FileHandle(forReadingFrom: url)
                guard let fileHandle else {
                    return
                }
                if let data = try fileHandle.read(upToCount: 63) {
                    if let dataStr = String(data: data, encoding: .utf8) {
                        print("Read: \(dataStr)")
                        var l = dataStr.startIndex
                        var r = dataStr.index(after: l)

                        while dataStr[l] != "~" {
                            var points = [CGPoint]()
                            while dataStr[l] != " " {
                                let y = dataStr[l]
                                let x = dataStr[r]
                                let point = CGPoint(x: x.wholeNumberValue!, y: y.wholeNumberValue!)
                                points.append(point)
                                l = dataStr.index(l, offsetBy: 2)
                                r = dataStr.index(r, offsetBy: 2)
                            }
                            
                            grid.append(GridShape(shapeCoordinates: points, position: .init(x: 100, y: 100), color: .red, size: 10))
                            l = dataStr.index(after: l)
                            r = dataStr.index(after: l)
                        }
                        
                        readNext()
                        return
                    }
                } else {
                    print("Read failed")
                }
            } else {
                print("wrong url")
            }
        } catch {
            print("Error converting file to string: \(error.localizedDescription)")
        }
        
        grid = []
    }
    
    func readNext() {
        guard let fileHandle else {
            return
        }
        do {
            let offset = UInt64(63)
            try fileHandle.seek(toOffset: offset * UInt64.random(in: 0...1360000))
            if let data = try fileHandle.read(upToCount: 63) {
                if let dataStr = String(data: data, encoding: .utf8) {
                    grid = []
                    print("Read: \(dataStr)")
                    var l = dataStr.startIndex
                    var r = dataStr.index(after: l)
                    
                    while dataStr[l] != "~" {
                        var points = [CGPoint]()
                        while dataStr[l] != " " {
                            let y = dataStr[l]
                            let x = dataStr[r]
                            let point = CGPoint(x: x.wholeNumberValue!, y: y.wholeNumberValue!)
                            points.append(point)
                            l = dataStr.index(l, offsetBy: 2)
                            r = dataStr.index(r, offsetBy: 2)
                        }
    
                        let color = Color(hue: Double.random(in: 0...1), saturation: 0.7, brightness: 0.9)

                        
                        grid.append(GridShape(shapeCoordinates: points, position: .init(x: 100, y: 100), color: color, size: 10))
                        l = dataStr.index(after: l)
                        r = dataStr.index(after: l)
                    }
                    return
                }
            } else {
                print("Read failed")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
