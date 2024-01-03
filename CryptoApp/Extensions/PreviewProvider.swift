//
//  PreviewProvider.swift
//  CryptoApp
//
//  Created by Aman Gupta on 03/01/24.
//

import Foundation
import SwiftUI


extension PreviewProvider{
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    static let instance = DeveloperPreview()
    private init(){ }
    
    let coin = CoinModel(id: "bitcoin", symbol: "BTC", name: "bitcoin", image: "https://assets.coingecko.com/images/1/large/bitcoin.png?1547033579", currentPrice: 61408, marketCap: 1141731099010, marketCapRank: 1, fullyDilutedValuation: 1285385611303, totalVolume: 6719095290, high24H: 61712, low24H: 56220, priceChange24H: 3952.64, priceChangePercentage24H: 6.81212, marketCapChange24H: 7110681879, marketCapChangePercentage24H: 6.74171, circulatingSupply: 18653043, totalSupply: 21000000, maxSupply: 21000000, ath: 61712, athChangePercentage: -0.98776, athDate: "2021-03-13T20:49:26:606Z", atl: 67.31, atlChangePercentage: 90020.24075, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated:"2021-07-06T00:00:00.000Z" , sparklineIn7D:SparklineIn7D( price:[54019.313123,54431.123123,54323.213, 65431.123123,73345.12312]), currentHoldings: 1.5)
}



