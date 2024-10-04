//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Aman Gupta on 03/01/24.
//

import Foundation
import Combine

class CoinDataService{
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?
    
    init(){
       getCoins()
    }
    
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en&precision=18") else {
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: {[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
                
            })
            
    
    }
}

//class CoinDataLoader{
//    @Published var coins:[CoinModel] = []
//    
//    func getCoins() async throws->[CoinModel]{
//        let endpoint = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en&precision=18"
//        
//        guard let url = URL(string: endpoint) else { throw TError.invalidURL}
//        let (data,_) = try await URLSession.shared.data(from:url,delegate: nil)
//
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        do{
//            return try decoder.decode([CoinModel].self, from:data)
//        }
//        catch{
//            if let decodingError = error as? DecodingError{
//                switch decodingError{
//                case .dataCorrupted(let context):
//                    print("Data Corrupted: \(context)")
//                case .keyNotFound(let key, let context):
//                    print("Key \(key.stringValue) not found: \(context)")
//                case .typeMismatch(let type, let context):
//                    print("Type mismatch for type \(type) \(context)")
//                case .valueNotFound(let type, let context):
//                    print("Valur not found for type \(type) \(context)")
//                default:
//                    print("Unknown decoding error occured")
//                }
//            } else{
//                throw error
//            }
//            throw error
//        }
//    }
//    
//}


enum TError:Error{
    case invalidResponse
    case invalidURL
    case invalidData
}
