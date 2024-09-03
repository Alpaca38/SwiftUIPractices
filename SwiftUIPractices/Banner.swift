//
//  Banner.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/3/24.
//

import SwiftUI

struct Banner: Hashable, Identifiable {
    let id = UUID()
    var total = Int.random(in: 1000...5000) * 150
//    let color = Color.random()
    
    var totalFormat: String {
        return total.formatted() + "원"
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1)
        )
    }
}
