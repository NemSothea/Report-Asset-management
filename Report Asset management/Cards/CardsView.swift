//
//  CardsView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI


struct CreditCardView: View {
    
    @ObservedObject var card: CardModel
    
    var textColor           : Color
    
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

struct CardsView: View {
    
    @StateObject private var cardsData = CardsData()
    @State private var selectedIndex: Int = 0  // Tracks the current tab index
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                TabView(selection : $selectedIndex) {
                    ForEach(Array(cardsData.cards.enumerated()), id: \.1.id) { index,card in
                        CreditCardView(card: card)
                            .tag(index)  // Tag each card with its index for trackin
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 280)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                
                VStack {
                    HStack {
                        
                        Text("Balance :")
                          .font(.system(size: 18, weight: .semibold))
                        Spacer()
                        Text("$\(cardsData.cards[selectedIndex].balance, specifier: "%.2f")")
                        .font(.system(size: 18, weight: .semibold))
                                            
                    }
                    .padding()
                    List {
                        ForEach(cardsData.cards[selectedIndex].cardList) { transaction in
                                VStack(alignment:.leading) {
                                   
                                    HStack {
                                        VStack(alignment:.leading) {
                                            Text(transaction.accountType)
                                                .fontWeight(.heavy)
                                            Text(fomateDate(with: transaction.cardDate))
                                                .fontWeight(.light)
                                            Text("\(cardsData.cards[selectedIndex].balance, specifier: "%.2f") USD")
                                                .foregroundStyle(.pink)
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                        
                                        VStack {
                                            Text("\(transaction.payAmount, specifier: "%.2f") USD")
                                                .fontWeight(.heavy)
                                            Text(transaction.payPlace)
                                                .foregroundStyle(.pink)
                                            Spacer()
                                        }
                                    }
                                }
                        }
                    }
                }
                .frame(height: 700)
            }
           
            .navigationTitle("Credit Cards")
            
        }
    }
    
  
    private func fomateDate(with cardDate : String) -> String {
        let cleanCardDate = cardDate.replacingOccurrences(of: " ", with: "") // Remove spaces
        guard cleanCardDate.count == 8 else { return cardDate }
        
        let start = cleanCardDate.prefix(4)  // First 2 digits
        let middle = cleanCardDate.suffix(2)    // Last 4 digits
        let end = cleanCardDate.suffix(2)    // Last 4 digits
        return "\(start)/\(middle)/\(end)"     // Hide the middle digits with "****"
    }
    
}
struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            .previewDevice(PreviewDevice(rawValue: "iphone 15 Pro"))
            .previewDisplayName("iphone 15 Pro")
            .previewInterfaceOrientation(.portrait)
    }
}
