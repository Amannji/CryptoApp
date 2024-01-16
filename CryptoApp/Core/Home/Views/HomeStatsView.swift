//
//  HomeStatsView.swift
//  CryptoApp
//
//  Created by Aman Gupta on 16/01/24.
//

import SwiftUI

struct HomeStatsView: View {
    let statistics : [StatisticalModel] = [
        StatisticalModel(title:"Value",value:"$500",percentageChange: 20),
        StatisticalModel(title:"Value",value:"$500",percentageChange: 20),
        StatisticalModel(title:"Value",value:"$500",percentageChange: 20),
    ]
    @Binding var showPortfolio:Bool
    var body: some View {
        HStack{
            ForEach(statistics){stat in
                StatisticalView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
}
