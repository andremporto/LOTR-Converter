//
//  CurrencyIcon.swift
//  LOTR Converter
//
//  Created by André Porto on 27/10/23.
//

import SwiftUI

struct CurrencyIcon: View {
    
    @State var currencyImage: String
    @State var currencyText: String
    
    
    var body: some View {
        ZStack {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            VStack {
                Spacer()
                
                Text(currencyText)
                    .padding(3)
                    .font(.caption)
                .background(.brown.opacity(0.75))
            }
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

#Preview {
    CurrencyIcon(currencyImage: "goldpenny", currencyText: "Gold Penny")
        .previewLayout(.sizeThatFits)
}
