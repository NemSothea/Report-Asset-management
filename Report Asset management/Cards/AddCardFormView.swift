//
//  AddCardView.swift
//  Report Asset management
//
//  Created by sothea007 on 23/9/24.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AddCardFormView: View {
    
    @State private var cardNumber       : String
    @State private var cardName         : String
    @State private var cardExpiryDate   : String
    @State private var cvcNumber        : String
    
    var cardDetails      : CardDetails
    
    // Initialize state from cardDetails
    init(cardDetails: CardDetails) {
        self.cardDetails = cardDetails
        _cardNumber = State(initialValue: cardDetails.number ?? "0000 0000 0000 0000")
        _cardName = State(initialValue: cardDetails.name ?? "Unknown")
        _cardExpiryDate = State(initialValue: cardDetails.expiryDate ?? "00/00")
        _cvcNumber = State(initialValue: "") // Initialize CVC as empty since it's sensitive data
    }
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                CreditCardView(card: CardModel(cardColor: [.red,.blue], cardImg: nil, cardNumber: cardNumber, cardName: cardName, cardExpiryDate: cardExpiryDate, balance: 0.0, cardList: [CardModel.CardList(accountType: "", cardDate: cardExpiryDate, payAmount: 0.0, payPlace: "unknow")]), textColor: .white)
            }
            .padding(.top, 50)
            // Edit From
            VStack(alignment:.center) {
                VStack(alignment:.center,spacing: 10) {
                    CardFormFieldView(text: $cardNumber, fieldTitle: "Card Number : ", isCreditCardNumber: true)
                        .keyboardType(.numberPad)
                        .padding(.top,20)
                    CardFormFieldView(text: $cardName, fieldTitle: "Card Name :", autocapitalizationType: .words)
                        .keyboardType(.alphabet)
                    
                    HStack(spacing: 20) {
                        CardFormFieldView( text: $cardExpiryDate,fieldTitle: "Card Expiry Date : ", isExpiryDate: true)
                            .keyboardType(.numberPad)
                        
                        CardFormFieldView(text: $cvcNumber,fieldTitle: "CVC #")
                            .keyboardType(.numberPad)
                    }
                    .padding(.top,5)
                    
                    Button(action: {
                        // Handle card addition logic
                                             print("Card added with number: \(cardNumber), name: \(cardName), expiry: \(cardExpiryDate), cvc: \(cvcNumber)")
                    }, label: {

                        Text("add new card")
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .padding(.all,10)
                            .background(Color.buttonColor)
                            .cornerRadius(15)
                      
                    })
                    .padding(.top)
                }
                .padding(20)
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .background(Color.backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    AddCardFormView(cardDetails: CardDetails())
}
