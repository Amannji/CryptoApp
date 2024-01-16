//
//  StatisticalModel.swift
//  CryptoApp
//
//  Created by Aman Gupta on 16/01/24.
//

import Foundation
struct StatisticalModel: Identifiable{
    let id = UUID().uuidString
    let title: String
    let value:String
    let percentageChange: Double?
    
    init(title:String, value: String, percentageChange: Double?){
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
