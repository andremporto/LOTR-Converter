//
//  ContentView.swift
//  LOTR Converter
//
//  Created by André Porto on 25/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Troca de Moedas")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Left Convertion Section
                HStack {
                    VStack {
                        HStack {
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.subheadline.bold())
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(
                                leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        // Text Field
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                        .padding(7)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(7)
                        .keyboardType(.decimalPad)
                        .onChange(of: leftTyping ? leftAmount : leftAmountTemp) { _ in
                            rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                        }
                        .onChange(of: leftCurrency) { _ in
                            leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                        }
                    }
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    // Right Convertion Section
                    VStack {
                        HStack {
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.subheadline.bold())
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(
                                leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        // Text field
                        TextField("Amount", text: $rightAmount, onEditingChanged: { typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                            
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) { _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(8)
                
                Spacer()
                
                // Info button
                HStack {
                    Spacer()
                    
                    Button(action: {
                        showExchangeInfo.toggle()
                    }, label: {
                        Image(systemName: "info.circle.fill")
                    })
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
