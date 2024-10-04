//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Aman Gupta on 29/09/24.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    SearchBarView(searchText: $vm.searchText)
                    CoinLogoList
                }
            }
            .navigationTitle("Edit Profile")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    XMarkButton()
                })
                ToolbarItem(placement: .navigationBarTrailing,content:{
                    HStack{
                        Image(systemName: "checkmark")
                        Text("Save")
                            .font(.headline)
                    }
                    
                })
            })
        }
       
    }
}

struct PortfolioView_Previews: PreviewProvider{
    static var previews: some View{
       PortfolioView()
            .environmentObject(dev.homeVM)
    }
}



extension PortfolioView{
    private var CoinLogoList: some View{
        ScrollView(.horizontal, showsIndicators: true){
            LazyHStack{
                ForEach(vm.allCoins){ coin in
                    CoinLogoView(coin: coin)
                        .frame(width:75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn){
                                selectedCoin = coin
                            }
                        }
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 2)
                                .animation(.none)
                        }
                    
                    
                }
            }
            .padding(.vertical,4)
            .padding(.leading)
            
            if selectedCoin != nil{
                VStack(spacing:20){
                    HStack{
                        Text("Current Price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                        Spacer()
                        Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
                    }
                    Divider()
                    HStack{
                        Text("Amount in your porfolio")
                        Spacer()
                        TextField("Ex: 1.4", text: $quantityText)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            
        }
    }
    
}
