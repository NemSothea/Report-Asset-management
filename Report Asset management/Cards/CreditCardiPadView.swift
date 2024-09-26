//
//  CardsView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI


import SwiftUI

struct CardsiPadView: View {
    
    @StateObject private var cardsData = CardsData()
    @State private var selectedCard: CardModel?

    var body: some View {
        NavigationSplitView {
            // Master View: List of Cards
            List(selection: $selectedCard) {
                ForEach(cardsData.cards) { card in
                    CreditCardThumbnailView(card: card)
                              
                        .tag(card)
                }
            }
            .navigationTitle("My Cards")
        } detail: {
            // Detail View: Selected Card Details
            if let card = selectedCard {
                CardDetailView(card: card)
            } else {
              
                Text("Select a card to view details")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
        }
    }
}


struct CardDetailView: View {
    var card: CardModel

    var body: some View {
        VStack(alignment: .leading) {
            // Display the selected card
            CreditCardiPadView(card: card, textColor: .white)
                .frame(height: 220)
                .padding()

            // Show balance
            Text("Balance : $\(card.balance, specifier: "%.2f")")
                .font(.title2)
                .padding(.horizontal)

            // Transactions List
            List {
                ForEach(card.cardList) { transaction in
                    TransactionRowView(transaction: transaction, balance: card.balance)
                }
            }
        }
        .navigationTitle(card.cardName)
    }
}

struct TransactionRowView: View {
    
    var transaction : CardModel.CardList
    var balance      : Float

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.accountType)
                    .font(.headline)
                Text(formatDate(with: transaction.cardDate))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("$\(balance, specifier: "%.2f")")
                    .foregroundStyle(.pink)
             
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("$\(transaction.payAmount, specifier: "%.2f")")
                    .fontWeight(.heavy)
                Text(transaction.payPlace)
                    .font(.subheadline)
                    .foregroundStyle(.pink)
            }
        }
        .padding(.vertical, 8)
    }
}

func formatDate(with cardDate: String) -> String {
    // Format date from "YYYYMMDD" to "YYYY/MM/DD"
    let cleanCardDate = cardDate.replacingOccurrences(of: " ", with: "")
    guard cleanCardDate.count == 8 else { return cardDate }
    let year = cleanCardDate.prefix(4)
    let month = cleanCardDate.dropFirst(4).prefix(2)
    let day = cleanCardDate.suffix(2)
    return "\(year)/\(month)/\(day)"
}

struct CreditCardiPadView: View {
    @ObservedObject var card: CardModel
    var textColor: Color

    init(card: CardModel, textColor: Color = .primary) {
        self.card = card
        self.textColor = textColor
    }

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Spacer()

            Image("chip")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)

            Text(formattedCardNumber)
                .font(.system(size: 26, weight: .bold, design: .monospaced))
                .foregroundStyle(.white)

            Spacer()

            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Name")
                        .font(.system(size: 14, weight: .regular, design: .rounded))

                    Text(card.cardName)
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                }

                Spacer(minLength: 10)

                VStack(alignment: .trailing, spacing: 4) {
                    Text("Exp. Date")
                        .font(.system(size: 14, weight: .regular, design: .rounded))

                    Text(formattedExpiredDate)
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                }

                Spacer(minLength: 10)

                if let img = card.cardImg {
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                }
            }
        }
        .padding(.init(top: 8, leading: 16, bottom: 4, trailing: 16))
        .foregroundColor(textColor)
        .background(LinearGradient(gradient: Gradient(colors: card.cardColor), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(7)
        .frame(width: 340, height: 200, alignment: .center)
    }

    // Format the card number to show the first 4 and last 4 digits, with middle digits hidden
       private var formattedCardNumber: String {
           let cleanCardNumber = card.cardNumber.replacingOccurrences(of: " ", with: "") // Remove spaces
           guard cleanCardNumber.count == 16 else { return card.cardNumber } // Make sure it's a valid card number

           let start = cleanCardNumber.prefix(4)  // First 4 digits
           let end = cleanCardNumber.suffix(4)    // Last 4 digits
           return "\(start) **** **** \(end)"     // Hide the middle digits with "****"
       }
    // Format the card expiredDate to show the first 2 and last 4 digits, with middle digits hidden
       private var formattedExpiredDate: String {
           let cleanCardDate = card.cardExpiryDate.replacingOccurrences(of: " ", with: "") // Remove spaces
           guard cleanCardDate.count == 6 else { return card.cardExpiryDate } // Make sure it's a valid card number

           let start = cleanCardDate.prefix(2)  // First 2 digits
           let end = cleanCardDate.suffix(4)    // Last 4 digits
           return "\(start)/\(end)"     // Hide the middle digits with "****"
       }
}
struct CreditCardThumbnailView: View {
    var card: CardModel

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack {
                // Chip Image
                Image("chip")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)

                // Card Name
                Text(card.cardName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(formattedCardNumber)
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)

                // Exp. Date
                Text("Exp. Date: \(formattedExpiredDate)")
                    .font(.subheadline)
                    .foregroundColor(.white)

                if let img = card.cardImg {
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
            }
            .frame(width: 300,height: 300)
            .background(LinearGradient(gradient: Gradient(colors: card.cardColor), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(8)
            
        }
     
       
    }
    
        

    // Format the card number to show the first 4 and last 4 digits, with middle digits hidden
       private var formattedCardNumber: String {
           let cleanCardNumber = card.cardNumber.replacingOccurrences(of: " ", with: "") // Remove spaces
           guard cleanCardNumber.count == 16 else { return card.cardNumber } // Make sure it's a valid card number

           let start = cleanCardNumber.prefix(4)  // First 4 digits
           let end = cleanCardNumber.suffix(4)    // Last 4 digits
           return "\(start) **** **** \(end)"     // Hide the middle digits with "****"
       }
    // Format the card expiredDate to show the first 2 and last 4 digits, with middle digits hidden
       private var formattedExpiredDate: String {
           let cleanCardDate = card.cardExpiryDate.replacingOccurrences(of: " ", with: "") // Remove spaces
           guard cleanCardDate.count == 6 else { return card.cardExpiryDate } // Make sure it's a valid card number

           let start = cleanCardDate.prefix(2)  // First 2 digits
           let end = cleanCardDate.suffix(4)    // Last 4 digits
           return "\(start)/\(end)"     // Hide the middle digits with "****"
       }
}




struct CardsiPadView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardsiPadView()
               
        }
         
    }
}
