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
    
    private let dataService = CoinDataLoader()
    private var cancellables = Set<AnyCancellable>()
//    init(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portfolioCoins.append(DeveloperPreview.instance.coin)
//        }
//        addSubscribers()
//    }
    
    func addSubscribers() async{
        do{
            self.allCoins = try await dataService.getCoins()
        }
        catch{
            print(error,error.localizedDescription)
        }
    }
}
