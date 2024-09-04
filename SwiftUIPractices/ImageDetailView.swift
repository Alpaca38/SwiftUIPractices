//
//  ImageDetailView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/4/24.
//

import SwiftUI

struct ImageDetailView: View {
    @Binding var sectionTitle: String
    
    var body: some View {
        RandomImageView()
            .frame(width: 200, height: 300)
        TextField(sectionTitle, text: $sectionTitle)
            .padding()
    }
}

//#Preview {
//    ImageDetailView()
//}
