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
    
    @Published var cancellables = Set<AnyCancellable>()
    
    private let dataService = CoinDataService()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
//        dataService.$allCoins
//            .sink{[weak self] (returnedCoins) in
//                self?.allCoins = returnedCoins
//                
//            }
//            .store(in: &cancellables)
        
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .combineLatest(dataService.$allCoins)
            .map(filterCoins)
            
            .sink{[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                
            }
            .store(in: &cancellables)
    
            
    }
    
    func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel]{
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        return coins.filter{ (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    

}
