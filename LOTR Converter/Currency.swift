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
}

enum CurrencyText: String, CaseIterable {
    case copperPenny = "Moeda de Cobre"
    case silverPenny = "Moeda de Prata"
    case silverPiece = "Peça de Prata"
    case goldPenny = "Moeda de Ouro"
    case goldPiece = "Peça de Ouro"
}

enum CurrencyImage: String, CaseIterable {
    case copperPenny = "copperpenny"
    case silverPenny = "silverpenny"
    case silverPiece = "silverpiece"
    case goldPenny = "goldpenny"
    case goldPiece = "goldpiece"
}
