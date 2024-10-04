//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Aman Gupta on 17/01/24.
//

import Foundation
//JSon Data
//{
//  "data": {
//    "active_cryptocurrencies": 12278,
//    "upcoming_icos": 0,
//    "ongoing_icos": 49,
//    "ended_icos": 3376,
//    "markets": 981,
//    "total_market_cap": {
//      "btc": 41447468.81862694,
//      "eth": 694520459.8632132,
//      "ltc": 25367301511.41178,
//      "bch": 7211569949.826606,
//      "bnb": 5668281846.708554,
//      "eos": 2320859627462.232,
//      "xrp": 3093545064396.2007,
//      "xlm": 14830734299914.268,
//      "link": 111835389332.5207,
//      "dot": 239875520177.57407,
//      "yfi": 223690271.12984475,
//      "usd": 1754758801098.8853,
//      "aed": 6444790386735.919,
//      "ars": 1436525978684920.8,
//      "aud": 2683836905446.3022,
//      "bdt": 192565505904689.94,
//      "bhd": 661387894480.9824,
//      "bmd": 1754758801098.8853,
//      "brl": 8653066599978.815,
//      "cad": 2373579756582.809,
//      "chf": 1519377210278.2805,
//      "clp": 1618817636777752.8,
//      "cny": 12512483107115.717,
//      "czk": 39943469303885.84,
//      "dkk": 12045754115958.225,
//      "eur": 1615237928823.5112,
//      "gbp": 1384915307626.4763,
//      "gel": 4691786344438.152,
//      "hkd": 13723178941933.863,
//      "huf": 614679777356096.5,
//      "idr": 27431247687417156,
//      "ils": 6661529420053.668,
//      "inr": 145953116136680.2,
//      "jpy": 260286005105199.22,
//      "krw": 2364790125879137,
//      "kwd": 540239346853.1132,
//      "lkr": 565217039865245.9,
//      "mmk": 3684797686320629.5,
//      "mxn": 30296366938260.516,
//      "myr": 8278074644184.006,
//      "ngn": 1598146578100810.2,
//      "nok": 18480235294737.688,
//      "nzd": 2876637519199.44,
//      "php": 98354227292074.67,
//      "pkr": 491318961438713.5,
//      "pln": 7102979355922.512,
//      "rub": 155563723028760.44,
//      "sar": 6581063200470.471,
//      "sek": 18371654329643.29,
//      "sgd": 2361436825679.2036,
//      "thb": 62557151259175.086,
//      "try": 52866844977107.875,
//      "twd": 55477578630900.66,
//      "uah": 66448900951981.195,
//      "vef": 175703998754.03113,
//      "vnd": 43061576044195960,
//      "zar": 33471671424442.176,
//      "xdr": 1313226391566.3833,
//      "xag": 77850874423.2686,
//      "xau": 875238594.8120996,
//      "bits": 41447468818626.94,
//      "sats": 4144746881862694
//    },
//    "total_volume": {
//      "btc": 1749624.7722598386,
//      "eth": 29317838.605185732,
//      "ltc": 1070831594.6619202,
//      "bch": 304422484.4299976,
//      "bnb": 239275560.5547391,
//      "eos": 97970602617.85562,
//      "xrp": 130588024625.94037,
//      "xlm": 626050778528.4169,
//      "link": 4720914766.779817,
//      "dot": 10125881370.415174,
//      "yfi": 9442652.37027957,
//      "usd": 74073750587.24496,
//      "aed": 272054367469.30344,
//      "ars": 60640167178855.695,
//      "aud": 113292986720.66882,
//      "bdt": 8128780574947.424,
//      "bhd": 27919211407.589108,
//      "bmd": 74073750587.24496,
//      "brl": 365272478895.822,
//      "cad": 100196080953.08861,
//      "chf": 64137571757.22245,
//      "clp": 68335257129251.016,
//      "cny": 528190285937.4091,
//      "czk": 1686136340192.4214,
//      "dkk": 508488223829.9638,
//      "eur": 68184146678.05305,
//      "gbp": 58461522470.97363,
//      "gel": 198054690632.64655,
//      "hkd": 579297470155.0775,
//      "huf": 25947518536670.348,
//      "idr": 1157957092577177.2,
//      "ils": 281203586773.0878,
//      "inr": 6161128649344.441,
//      "jpy": 10987470535231.922,
//      "krw": 99825043684553.42,
//      "kwd": 22805159667.045624,
//      "lkr": 23859544692079.74,
//      "mmk": 155546611084123.78,
//      "mxn": 1278902563063.9358,
//      "myr": 349442918395.32874,
//      "ngn": 67462668347333.375,
//      "nok": 780107408014.5673,
//      "nzd": 121431691918.94118,
//      "php": 4151833572267.5684,
//      "pkr": 20740080166917.824,
//      "pln": 299838542429.5726,
//      "rub": 6566821840608.221,
//      "sar": 277806860866.1589,
//      "sek": 775523872475.7296,
//      "sgd": 99683490599.02481,
//      "thb": 2640729208435.2754,
//      "try": 2231671661493.581,
//      "twd": 2341878735764.796,
//      "uah": 2805011898405.19,
//      "vef": 7417004646.300827,
//      "vnd": 1817761188485815.2,
//      "zar": 1412941903627.8281,
//      "xdr": 55435313464.48236,
//      "xag": 3286324166.8409543,
//      "xau": 36946505.31790594,
//      "bits": 1749624772259.8386,
//      "sats": 174962477225983.88
//    },
//    "market_cap_percentage": {
//      "btc": 47.29115262986648,
//      "eth": 17.30818225791039,
//      "usdt": 5.416092148444183,
//      "bnb": 2.714734223510708,
//      "sol": 2.4448202600098488,
//      "xrp": 1.7518850904870449,
//      "usdc": 1.4516817368483712,
//      "steth": 1.338631954583798,
//      "ada": 1.0542958123817023,
//      "avax": 0.7466361393570441
//    },
//    "market_cap_change_percentage_24h_usd": -1.2438539848739403,
//    "updated_at": 1705515151
//  }
//}

struct GlobalData:Codable{
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let activeCryptocurrencies, upcomingIcos, ongoingIcos, endedIcos: Int
    let markets: Int
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    let updatedAt: Int

    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
    
    var marketCap: String{
       
        if let item = totalMarketCap.first(where:{$0.key == "usd"}){
            return "$" + item.value.formattedAbrreviation()
        }
        return ""
    }
    var volume: String{
        if let item = totalVolume.first(where: {$0.key == "usd"}){
            return "$" + item.value.formattedAbrreviation()
        }
        return ""
    }
    
    var btcDominance:String{
        if let item = totalVolume.first(where: {$0.key == "btc"}){
            return "\(item.value.asPercentString())"
        }
        return ""
    }
}
