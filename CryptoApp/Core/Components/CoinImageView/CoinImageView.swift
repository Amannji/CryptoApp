//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by Aman Gupta on 14/01/24.
//

import SwiftUI

//class CoinImageViewDM{
//    private var urlString: String
//    
//    func getData() async throws->Data{
//        do{
//            let (data, _) = try await URLSession.shared.data(from: url)
//            return data
//        }
//        catch{
//            throw error
//        }
//    }
//    
//    init(urlString: String){
//        self.urlString = urlString
//    }
//}
//
//
//class CoinImageViewModel: ObservableObject{
//    @Published var image: UIImage? = nil
//    @Published var isLoading: Bool = true
//    private let dataManager: CoinImageView
//    private let coin:[CoinModel]
//    
//    init(coin:CoinModel){
//        self.coin = coin
//        self.dataManager  = CoinImageViewDM(urlString: coin.image)
//        getImage()
//    }
//    
//    func getImage()->UIImage{
//        
//        
//    }
//    
//    
//}


class CoinImageViewDataLoader{
    
    var urlString: String
    
    func getData() async throws->UIImage{
        do{
            
            let (data,_) = try await URLSession.shared.data(from: URL(string: urlString)!, delegate: nil)
            return UIImage(data: data)!
        }
        catch{
            throw error
        }
    }
    
    init(urlString: String){
        self.urlString = urlString
    }
}

class CoinImageViewModel: ObservableObject{
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    
    var manager: CoinImageViewDataLoader
    var coin: CoinModel
    
    init(coin: CoinModel){
        self.coin = coin
        self.manager = CoinImageViewDataLoader(urlString: self.coin.image)
    }
    
    func getImage() async{
        self.image = try? await manager.getData()
    }
}


struct CoinImageView: View {
    @StateObject var vm: CoinImageViewModel
    var coin: CoinModel
    
    init(coin: CoinModel){
        self.coin = coin
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin:coin))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image{
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:50,height:50)
                
                
            } else if vm.isLoading{
                ProgressView()
            }
            else{
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
            
        }
        .onAppear{
            Task{
                await vm.getImage()
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider{
    static var previews: some View{
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
