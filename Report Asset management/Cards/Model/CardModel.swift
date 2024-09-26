//
//  CardModel.swift
//  Report Asset management
//
//  Created by sothea007 on 20/9/24.
//

import Foundation
import SwiftUI

class CardModel : ObservableObject, Identifiable,Hashable {
    
    static func == (lhs: CardModel, rhs: CardModel) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id = UUID()
   @Published var cardColor     : [Color]
   @Published var cardImg       : String?
   @Published var cardNumber    : String
   @Published var cardName      : String
   @Published var cardExpiryDate: String
   @Published var balance       : Float
   @Published var cardList      : [CardList]
    
    init(cardColor: [Color],cardImg : String?,cardNumber: String, cardName: String, cardExpiryDate: String, balance: Float, cardList: [CardList]) {
           self.cardColor = cardColor
        self.cardImg = cardImg
           self.cardNumber = cardNumber
           self.cardName = cardName
           self.cardExpiryDate = cardExpiryDate
           self.balance = balance
           self.cardList = cardList
       }
    
    class CardList : Identifiable {
        static func == (lhs: CardModel.CardList, rhs: CardModel.CardList) -> Bool {
            lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        var id          = UUID()
        var accountType : String
        var cardDate    : String
        var payAmount   : Float
        var payPlace    : String
        
        init(accountType: String, cardDate: String, payAmount: Float, payPlace: String) {
            self.accountType = accountType
            self.cardDate = cardDate
            self.payAmount = payAmount
            self.payPlace = payPlace
        }
    }
    
    static var all: [CardModel] {
        
        [
            CardModel(cardColor: [.pink, .green], cardImg: "visa",
                      cardNumber: "4111 1222 2222 4444",
                      cardName: "Nem Sothea",
                      cardExpiryDate: "052024",
                      balance: 2000.0,
                      cardList: [
                        CardList(accountType: "Withdraw", cardDate: "20241220", payAmount: 2.0, payPlace: "We-Café"),
                        CardList(accountType: "Tranfer", cardDate: "20240703", payAmount: 20.0, payPlace: "ABA Account"),
                        CardList(accountType: "Diposit", cardDate: "20240120", payAmount: 100.0, payPlace: "PPC Bank")
                      ]),
            CardModel(cardColor: [.gold, .green], cardImg: "mastercard-white-bg",
                      cardNumber: "8888 1222 2222 6666",
                      cardName: "Nem Sothea",
                      cardExpiryDate: "052026",
                      balance: 1300.0,
                      cardList: [
                        CardList(accountType: "Diposit", cardDate: "20241205", payAmount: 100.0, payPlace: "PPC Bank")
                      ]),
            CardModel(cardColor: [.green, .blue, .black], cardImg: "amex",
                      cardNumber: "7777 1222 2222 4321",
                      cardName: "Nem Sothea",
                      cardExpiryDate: "052025",
                      balance: 1000.0,
                      cardList: [
                        CardList(accountType: "Tranfer", cardDate: "20241102", payAmount: 20.0, payPlace: "ABA Account")
                      ])
        ]
        
    }
}

class CardsData: ObservableObject {
    
    @Published var cards: [CardModel] = CardModel.all

    var totalBalance: Float {
        cards.reduce(0) {$1.balance }
    }
}
