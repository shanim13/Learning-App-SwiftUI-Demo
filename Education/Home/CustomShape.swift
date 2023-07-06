//
//  TabItem.swift
//  Education
//
//  Created by Shanim on 04/04/23.
//

import Foundation
import SwiftUI

struct CustomShape: Shape {
    var centerX : CGFloat
    var animatableData: CGFloat{
        get{return centerX}
        set{centerX = newValue}
    }

    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 15))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 15))
            path.move(to: CGPoint(x: centerX - 35, y: 15))
            path.addQuadCurve(to: CGPoint(x: centerX + 35, y: 15), control: CGPoint(x: centerX, y: -30))
        }
    }
}
