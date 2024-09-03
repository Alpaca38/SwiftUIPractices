//
//  CoinDetailView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/3/24.
//

import SwiftUI

struct CoinDetailView: View {
    let marketData: Market
    
    var body: some View {
        Text(marketData.koreanName)
    }
}

#Preview {
    CoinDetailView(marketData: Market(market: "", koreanName: "", englishName: ""))
}
