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
    
//    Convert 12 to 12.00
//    Convert 1234 to 1.23K
//    Convert 123456 to  123.45K
//    Convert 12345678 to 12.34M
//    Convert 1234678890 to 1.23Bn
//    Convert 1234567890 to 123.45Bn
//    Convert 123567890123 to 12.34Tr
    func formattedAbrreviation()-> String{
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num{
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
            
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted  = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
            
        case 1_000...:
            let formatted  = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
            
        case 0:
            return  self.asNumberString()
        
        default:
            return "\(sign)\(self)"
        }
    }
    
    
    
}
