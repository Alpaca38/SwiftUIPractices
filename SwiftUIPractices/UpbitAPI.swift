//
//  UpbitAPI.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/3/24.
//

import Foundation

struct UpbitAPI {
    private init() { }

    static func fetchAllMarket(completion: @escaping (Markets) -> Void) {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(Markets.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    static func fetchMarket() async throws -> Markets {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        let (data, response) = try await URLSession.shared.data(from: url) // 응답이 올때까지 기다림
        let decodedData = try JSONDecoder().decode(Markets.self, from: data)
        
        return decodedData
    }
}

typealias Markets = [Market]
