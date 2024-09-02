//
//  RoundedRectWithColor.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/2/24.
//

import SwiftUI

private struct RoundedRectWithColor: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(color, in: RoundedRectangle(cornerRadius: 25))
            .foregroundStyle(.white)
    }
}

extension View {
    func asRoundedRectWithColor(color: Color) -> some View {
        modifier(RoundedRectWithColor(color: color))
    }
}
