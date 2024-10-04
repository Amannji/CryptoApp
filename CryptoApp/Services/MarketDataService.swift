//
//  MarketDataService.swift
//  CryptoApp
//
//  Created by Aman Gupta on 27/05/24.
//

import Foundation
import Combine



class MarketDataService{
    @Published var marketData: MarketDataModel? = nil
    
    
    var marketDataSubscription: AnyCancellable?
    
    init(){
       getCoins()
    }
    
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
       
        marketDataSubscription = NetworkManager.download(url:url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: {[weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
            
    
    }
}
