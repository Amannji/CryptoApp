//
//  HomeStatsView.swift
//  CryptoApp
//
//  Created by Aman Gupta on 16/01/24.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject var vm: HomeViewModel
    @Binding var showPortfolio:Bool
    var body: some View {
        HStack{
            ForEach(vm.stats){stat in
                StatisticalView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}


struct previews: PreviewProvider{
    static var previews: some View{
        HomeStatsView(showPortfolio: .constant(false)).environmentObject(dev.homeVM)
    }
}
