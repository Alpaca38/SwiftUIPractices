//
//  CoinView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/3/24.
//

import SwiftUI

struct CoinView: View {
    @State private var market: Markets = []
    @State private var banner = Market(market: "", koreanName: "", englishName: "")
    @State private var searchQuery = ""
    
    var filteredList: Markets {
        return searchQuery.isEmpty ? market : market.filter({ $0.koreanName.contains(searchQuery) })
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView()
                listView()
            }
            .navigationTitle("My Money")
            .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "코인을 검색해보세요.")
        }
        // onAppear는 기본적으로 동기적으로 동작하므로 비동기 작업을 처리하려면 추가적인 래핑이 필요
        // task는 비동기 환경 + 뷰가 사라지면 자동으로 진행중인 작업 취소
        .task { // Swift Concurrency
            do {
                let result = try await UpbitAPI.fetchMarket()
                market = result
                banner = result.randomElement() ?? Market(market: "", koreanName: "", englishName: "")
            } catch {
                print(error)
            }
        }
        .refreshable {
            UpbitAPI.fetchAllMarket { data in
                market = data
                banner = data.randomElement() ?? Market(market: "", koreanName: "", englishName: "")
            }
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.green)
                .frame(height: 150)
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .scaleEffect(2)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .padding()
                
            VStack(alignment: .leading) {
                Spacer()
                Text(banner.market)
                    .font(.callout)
                Text(banner.koreanName)
                    .font(.title).bold()
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(40)
        }
    }
    
    func rowView(_ item: Market) -> some View {
        NavigationLink {
            CoinDetailView(marketData: item)
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.koreanName)
                        .bold()
                    Text(item.market)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Text(item.englishName)
            }
            .foregroundStyle(.black)
            .padding(.horizontal, 20)
            .padding(.vertical, 6)
        }
    }
    
    func listView() -> some View {
        LazyVStack { // 보이지 않는 rowView는 인스턴스를 생성하지 않음
            ForEach(filteredList, id: \.self) { item in
                rowView(item)
            }
        }
    }
}

#Preview {
    CoinView()
}
