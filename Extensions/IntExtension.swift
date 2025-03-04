//
//  IntExtension.swift
//  ListOfItems
//
//  Created by piotr koscielny on 04/03/2025.
//

import Foundation

extension Int {
    
    private var priceFormater: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.alwaysShowsDecimalSeparator = true
        formatter.numberStyle = .decimal
        formatter.locale = .current
        formatter.currencyCode = "EUR"
        formatter.currencySymbol = "￡"
        formatter.maximumIntegerDigits = 3
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 2
        formatter.maximumIntegerDigits = 3
        return formatter
    }
    
    func formatPrice() -> String {
        let number = NSNumber(value: self)
        return priceFormater.string(from: number) ?? "0"
    }
}
