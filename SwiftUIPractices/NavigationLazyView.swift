//
//  NavigationLazyView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/4/24.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    
    var body: some View {
        build()
    }
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
}
