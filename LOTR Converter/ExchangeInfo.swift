//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by André Porto on 25/10/23.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                Text("Taxas de câmbio")
                    .font(.largeTitle)
                
                Text("Aqui no Prancing Pony, temos o prazer de vos oferecer um local onde podem trocar todas as moedas conhecidas no mundo inteiro, exceto uma. Costumávamos aceitar Brandy Bucks, mas depois de descobrirmos que era uma pessoa em vez de um pedaço de papel, percebemos que não tinha valor para nós. Abaixo está um guia simples das nossas taxas de câmbio:")
                    .font(.title2)
                    .padding()
                
                
                ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", text: "1 Peça de Ouro = 4 Moedas de Ouro")
                ExchangeRate(leftImage: "goldpenny", rightImage: "silverpiece", text: "1 Moeda de Ouro = 4 Moedas de Prata")
                ExchangeRate(leftImage: "silverpiece", rightImage: "silverpenny", text: "1 Peça de Prata = 4 Moedas de Prata")
                ExchangeRate(leftImage: "silverpenny", rightImage: "copperpenny", text: "1 Moeda de Prata = 100 Moedas de Cobre")
                
                Button("Fechar") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundStyle(.white)
                .background(Color.brown)
                .cornerRadius(10)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
        .preferredColorScheme(.dark)
}
