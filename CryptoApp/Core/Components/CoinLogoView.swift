//
//  CoinLogoView.swift
//  CryptoApp
//
//  Created by Aman Gupta on 29/09/24.
//

import SwiftUI

struct CoinLogoView: View {
    var coin: CoinModel
    var body: some View {
        VStack{
            CoinImageView(coin: coin)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct CoinLogoView_Preview: PreviewProvider{
    static var previews: some View{
        CoinLogoView(coin: dev.coin)
           
    }
}
