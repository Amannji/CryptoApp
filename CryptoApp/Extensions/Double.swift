//
//  Double.swift
//  CryptoApp
//
//  Created by Aman Gupta on 03/01/24.
//

import Foundation

extension Double{
    
    // Coverts a Double into a Currency with 2-6 decimal places
    /// ```
    ///Convert 1244.56 to $1,244.56
    ///Convert 1244.512312 to $1,244.51
    /// ```
    
    
    private var currencyFormatter2: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //        formatter.locale = .current // <- default value
        //        formatter.currencyCode = "usd" // <- cahnge currency
        formatter.currencySymbol = "$" // <- change currencySymbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    // Coverts a Double into a Currency as a String with 2-6 decimal places
    /// ```
    ///Convert 1244.56 to "$1,244.56"
    ///Convert 1244.512312 to "$1,244.51"
    /// ```
    func asCurrencyWith2Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    
    // Coverts a Double into a Currency with 2-6 decimal places
    /// ```
    ///Convert 1244.56 to $1,244.56
    ///Convert 1244.512312 to $1,244.512312
    ///Convert 1244.56512312 to $1,244.565123
    /// ```
    
    
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //        formatter.locale = .current // <- default value
        //        formatter.currencyCode = "usd" // <- cahnge currency
        formatter.currencySymbol = "$" // <- change currencySymbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    // Coverts a Double into a Currency as a String with 2-6 decimal places
    /// ```
    ///Convert 1244.56 to "$1,244.56"
    ///Convert 1244.512312 to "$1,244.512312"
    ///Convert 1244.56512312 to "$1,244.565123"
    /// ```
    func asCurrencyWith6Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    // Coverts a Double into a string representation
    /// ```
    ///Convert 1244.56 to "1244.56"
    /// ```
    
    func asNumberString()-> String{
        return String(format:"%.2f", self)
        
    }
    
    ///Converts a percentage into string percentage
    ///
    func asPercentString()->String{
        return asNumberString() + "%"
    }
}
