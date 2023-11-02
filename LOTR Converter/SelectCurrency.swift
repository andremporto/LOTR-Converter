//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by André Porto on 26/10/23.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Selecione a moeda que você irá começar:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Currency Icons
                IconGrid(currency: $leftCurrency)
                
                // Text
                Text("Selecione a moeda que você quer converter:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Currency icons
                IconGrid(currency: $rightCurrency)
                
                // Done Button
                Button("Fechar") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundStyle(.white)
                .background(Color.brown)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
}
