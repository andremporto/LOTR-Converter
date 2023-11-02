//
//  Currency.swift
//  LOTR Converter
//
//  Created by André Porto on 28/10/23.
//

import Foundation

enum Currency: Double, CaseIterable {
    case copperPenny = 640
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    func convert(amountString: String, to currency: Currency) -> String {
        guard let startAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (startAmount / self.rawValue) * currency.rawValue
        
        if convertedAmount > 0 {
            return String(format: "%.2f", convertedAmount)
        } else {
            return ""
        }
    }
}

enum CurrencyText: String, CaseIterable {
    case copperPenny = "Moeda de Cobre"
    case silverPenny = "Moeda de Prata"
    case silverPiece = "Prata"
    case goldPenny = "Moeda de Ouro"
    case goldPiece = "Ouro"
}

enum CurrencyImage: String, CaseIterable {
    case copperPenny = "copperpenny"
    case silverPenny = "silverpenny"
    case silverPiece = "silverpiece"
    case goldPenny = "goldpenny"
    case goldPiece = "goldpiece"
}
