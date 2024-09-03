//
//  Money.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/3/24.
//

import Foundation

struct Money: Identifiable {
    
    enum Category: String {
        case study = "자기계발"
        case food = "식비"
        case house = "정기지출"
        case hobby = "취미"
        case deposit = "저축"
    }
    
    let id = UUID()
    let amount: Int
    let product: String
    let category: Category
    
    var amountFormat: String {
        return amount.formatted() + "원"
    }
}

typealias Moneys = [Money]
