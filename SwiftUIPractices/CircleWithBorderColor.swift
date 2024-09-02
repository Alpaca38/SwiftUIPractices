//
//  CircleWithBorderColor.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/2/24.
//

import SwiftUI

private struct CircleWithBorderColor: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    let borderColor: Color
    let lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(borderColor, lineWidth: lineWidth)
            }
    }
}

extension View {
    func asCircleWithBorderColor(width: CGFloat, height: CGFloat, borderColor: Color, lineWidth: CGFloat) -> some View {
        modifier(CircleWithBorderColor(width: width, height: height, borderColor: borderColor, lineWidth: lineWidth))
    }
}
