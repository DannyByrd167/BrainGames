//
//  SizeControls.swift
//  BrainGames
//
//  Created by Danny Byrd on 5/10/25.
//

import SwiftUI

class SizeControls {
    static var proxy: GeometryProxy?
    
    static var squareSizeLarge: CGFloat {
        guard let proxy = SizeControls.proxy else { return 0 }
        return proxy.size.width / 2
    }
    
    static var squareSizeSmall: CGFloat {
        guard let proxy = SizeControls.proxy else { return 0 }
        return proxy.size.width / 5
    }
}
