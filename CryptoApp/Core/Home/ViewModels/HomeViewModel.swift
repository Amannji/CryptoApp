//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Aman Gupta on 03/01/24.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject{
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataLoader()
    
    func addSubscribers() async {
        do{
            let coins = try await dataService.getCoins()
            guard !searchText.isEmpty else{
                self.allCoins = coins
                return
            }
            let loweredText = searchText.lowercased()
            self.allCoins = coins.filter{(coin)-> Bool in
                return coin.name.lowercased().contains(loweredText) ||
                coin.symbol.lowercased().contains(loweredText) ||
                coin.id.lowercased().contains(loweredText)
                
            }
    
            
        }
        catch{
            print(error,error.localizedDescription)
        }
    }
}
