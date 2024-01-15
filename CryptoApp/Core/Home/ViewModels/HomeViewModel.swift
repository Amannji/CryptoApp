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
            self.allCoins = try await dataService.getCoins()
        }
        catch{
            print(error,error.localizedDescription)
        }
    }
}
