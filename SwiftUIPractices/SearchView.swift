//
//  SearchView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/3/24.
//

import SwiftUI

struct SearchView: View {
    @State private var money: Moneys = []
    @State private var searchQuery = ""
    
    var filteredList: [Money] {
        return searchQuery.isEmpty ? money : money.filter({ $0.product.contains(searchQuery) })
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                listView()
            }
            .navigationTitle("Search")
            .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "Search")
        }
        .task {
            money = dummy
        }
    }
    
    func rowView(_ item: Money) -> some View {
        HStack {
            Circle()
                .fill(.green)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(item.product)
                    .bold()
                Text(item.category.rawValue)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Image(systemName: "star")
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 6)
    }
    
    func listView() -> some View {
        LazyVStack { // 보이지 않는 rowView는 인스턴스를 생성하지 않음
            ForEach(filteredList, id: \.id) { item in
                rowView(item)
            }
        }
    }
}

#Preview {
    SearchView()
}

var dummy = [
    Money(amount: 21700, product: "스타벅스", category: .food),
    Money(amount: 500000, product: "청년절망적금", category: .deposit),
    Money(amount: 9000, product: "선식당", category: .food),
    Money(amount: 27000, product: "클린코드", category: .study),
    Money(amount: 150000, product: "스키장", category: .hobby),
    Money(amount: 600000, product: "월세", category: .house),
    Money(amount: 68400, product: "통신비", category: .house),
    Money(amount: 7000, product: "교동짬뽕", category: .food),
    Money(amount: 6500, product: "쉬즈베이글", category: .food),
    Money(amount: 4700, product: "컴포즈커피", category: .food),
    Money(amount: 8800, product: "메가커피", category: .food),
    Money(amount: 100000, product: "주택청약", category: .house),
    Money(amount: 63900, product: "솥고집", category: .hobby),
    Money(amount: 1500, product: "스타벅스", category: .food),
    Money(amount: 7800, product: "스타벅스", category: .food),
]
