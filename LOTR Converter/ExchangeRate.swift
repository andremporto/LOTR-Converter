//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by André Porto on 25/10/23.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftImage: String
    @State var rightImage: String
    @State var text: String
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: "goldpenny", rightImage: "silverpiece", text: "1 Peça de Ouro = 4 Moedas de Ouro")
    .previewLayout(.sizeThatFits)
}
