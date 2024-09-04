//
//  CategoryUpgradeView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/4/24.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

struct CategoryUpgradeView: View {
    @State private var query = ""
    @State private var categoryList: [Category] = []
    
    let item = ["SF", "가족", "스릴러"]
    
    
    var body: some View {
        NavigationView {
            categoryListView()
                .navigationTitle("영화 검색")
                .searchable(text: $query)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Text("추가")
                            .asButton {
                                categoryList.append(Category(name: item.randomElement()!, count: .random(in: 1...100)))
                            }
                    }
                }
        }
        
    }
    
    func categoryListView() -> some View {
        List {
            ForEach(categoryList, id: \.id) { item in
                rowView(item)
            }
        }
    }
    
    func rowView(_ item: Category) -> some View {
        LazyVStack {
            HStack {
                Image(systemName: "person")
                Text("\(item.name)(\(item.count))")
                Spacer()
            }
        }
    }
}

#Preview {
    CategoryUpgradeView()
}
