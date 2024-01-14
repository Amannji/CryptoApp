//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Aman Gupta on 14/01/24.
//

import Foundation
import UIKit

class CoinImageService{
    @Published var image: UIImage
    
    
    private func getCoinImage(_ urlString:String) async throws->UIImage{
        let url = URL(string:urlString)
        do{
            let (data,_) = try await URLSession.shared.data(for: url, delegate:nil)
            return UIImage(data: data)!
        }
        catch{
            throw error
        }
    }
}
