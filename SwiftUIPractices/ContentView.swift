//
//  ContentView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 80) {
                Image(NSDataAssetName(stringLiteral: "snaps_image"))
                Image(NSDataAssetName(stringLiteral: "launchImage"))
                
                NavigationLink {
                    ProfileView()
                } label: {
                    Text("시작하기")
                        .asRoundedRectWithColor(color: .blue)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

