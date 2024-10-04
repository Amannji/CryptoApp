//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Aman Gupta on 03/01/24.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject{
    @Published var stats: [StatisticalModel] = []
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    @Published var cancellables = Set<AnyCancellable>()
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
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
            .combineLatest(coinDataService.$allCoins)
            .map(filterCoins)
            
            .sink{[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
            .map(mapMarketData)
            .sink{ [weak self] (returnedStats) in
                self?.stats = returnedStats
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
    
    func mapMarketData(marketDataModel: MarketDataModel?)-> [StatisticalModel]{
        var stats: [StatisticalModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticalModel(title: "Market Cap", value:data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticalModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticalModel(title:"BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticalModel(title:"Porfolio Value", value:"$0.00", percentageChange: 0)
        stats.append(contentsOf: [
        marketCap,
        volume,
        btcDominance,
        portfolio,
        
        ])
        return stats
    }
    

}
