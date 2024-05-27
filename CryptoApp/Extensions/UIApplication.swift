//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Aman Gupta on 27/05/24.
//

import SwiftUI

extension UIApplication{
    
    func endEditing(){
        sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
    
}
