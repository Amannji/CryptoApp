//
//  CoinModel.swift
//  CryptoApp
//
//  Created by Aman Gupta on 02/01/24.
//


//MarketAPI
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en&precision=18
 
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 45193.18782921372,
     "market_cap": 885164533672,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 948972204603,
     "total_volume": 33342058842,
     "high_24h": 45870,
     "low_24h": 44717,
     "price_change_24h": 249.13,
     "price_change_percentage_24h": 0.55431,
     "market_cap_change_24h": 4008647268,
     "market_cap_change_percentage_24h": 0.45493,
     "circulating_supply": 19587987,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -34.55071,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 66542.05562,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2024-01-03T01:22:15.923Z",
     "sparkline_in_7d": {
       "price": [
         42503.07408429984,
         42392.50906374447,
         42436.80967635556,
         42262.30282693092,
         42224.671914531646,
         42338.012219856166,
         42435.56890043018,
         42440.88983174608,
         42451.25688145234,
         42721.40602948542,
         42730.51322512124,
         43192.07860598207,
         43011.02367374354,
         42925.24750937383,
         42902.70914063955,
         42947.10728285651,
         42972.56648375904,
         43084.07162126087,
         43036.116017383276,
         43165.543102880976,
         43163.754436607465,
         43449.87409024317,
         43325.14972150323,
         43333.829180725916,
         43456.353814657276,
         43584.36379780082,
         43536.81503839975,
         43422.25852140096,
         43400.05447681178,
         43398.54667213512,
         43215.268407375625,
         43126.423829364794,
         43057.37770365014,
         43016.269276224324,
         43059.14753295907,
         43122.555667944995,
         43065.827636758964,
         42829.927345036645,
         42884.79542867928,
         42572.978804890605,
         42449.66230419514,
         42497.014634785235,
         42544.07249181019,
         42471.792783348654,
         42631.57068347121,
         42549.597990331065,
         42442.46321161759,
         42619.10532470562,
         42600.65063315619,
         42441.391113520716,
         42342.51732769396,
         42623.2216784426,
         42760.77754488217,
         42677.09881245285,
         42676.479375875475,
         42563.64798692198,
         42328.164417610285,
         42497.76436587777,
         42664.70531317941,
         42741.527722385596,
         42879.939309750094,
         42850.655145760924,
         42835.47007369172,
         42982.74154672809,
         42322.50410465478,
         42057.75895875145,
         41828.741567703466,
         42060.86476860107,
         42123.828241872456,
         41996.76777422195,
         41884.08854790864,
         41733.467508522044,
         42074.70715618848,
         42155.999549793596,
         42172.344126842174,
         41896.359137804946,
         41946.10425449801,
         41985.3951649841,
         42122.75466489284,
         42056.01405444255,
         41952.03721210986,
         41697.04214062938,
         41691.87079880443,
         41774.82267692628,
         41907.45215905091,
         41991.04226539656,
         41962.64938065163,
         42204.449118601646,
         42401.66240460074,
         42408.18839492703,
         42504.38150233752,
         42409.83274947286,
         42357.23770525579,
         42282.884465118535,
         42282.63393164895,
         42164.157880557104,
         42196.98163538902,
         42335.55744660517,
         42165.86057289227,
         42073.015211800965,
         42163.76070503298,
         42218.6616018917,
         42234.648463328645,
         42242.48481370832,
         42552.579839506994,
         42452.298969414194,
         42739.195243823546,
         42650.897813156684,
         42500.5471636701,
         42522.84318280696,
         42483.49936488477,
         42492.79311721145,
         42465.67583900729,
         42589.5372906383,
         42593.6434744054,
         42637.78555540509,
         42625.63867458039,
         42520.767167937425,
         42535.35940592924,
         42320.53769024096,
         42261.04061756689,
         42493.27640875459,
         42654.07310665941,
         42572.754497154856,
         42343.309674986056,
         42349.34009086834,
         42245.39914515529,
         42417.93594644881,
         42471.252137087,
         42517.22683599427,
         42624.75918153122,
         42695.24696546856,
         42698.693072659524,
         42629.60830690303,
         42723.15369715388,
         42618.36479545917,
         42799.52956572305,
         42724.86357456684,
         42824.91156396779,
         43113.38780145854,
         43495.91349559831,
         43676.60837740915,
         43607.33367591317,
         43551.694753026575,
         44148.36896342266,
         45110.59479638119,
         44778.26991786429,
         45276.35143197483,
         45464.541063057346,
         45238.10906862397,
         45220.41331224573,
         45277.744790496195,
         45523.24755205503,
         45821.86853828148,
         45705.64199127352,
         45597.178005482405,
         45449.64245444473,
         45332.70632183878,
         45655.18393695227,
         45393.06622208525,
         45204.07472992095,
         45354.11149622858,
         45001.257287338616,
         45140.33732148373,
         45118.52363178442,
         44833.277572566316,
         45051.12016247057,
         45034.422922544996
       ]
     }
   }
 
 */



import Foundation

struct CoinModel: Identifiable, Codable{
    let id, symbol, name: String
   let image: String
   let currentPrice: Double
   let marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Double
   let high24H, low24H: Int
   let priceChange24H, priceChangePercentage24H: Double
   let marketCapChange24H: Int
   let marketCapChangePercentage24H: Double
   let circulatingSupply, totalSupply, maxSupply, ath: Int
   let athChangePercentage: Double
   let athDate: String
   let atl, atlChangePercentage: Double
   let atlDate: String
   let lastUpdated: String
   let sparklineIn7D: SparklineIn7D
   let currentHoldings: Double?
    
    
    func updateHoldings(amount: Double)-> CoinModel{
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double{
        return (currentHoldings ?? 0) * currentPrice
    }
    var rank: Int{
        return Int(marketCapRank)
    }
  
}

struct SparklineIn7D: Codable{
    let price:[Double]?
}
