//
//  CardsView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct CardsView: View {
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                TabView {
                    ForEach(0..<5) { num in
                        CreditCardView()
                            .padding(.bottom, 50)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 280)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                VStack {
                    HStack {
                        
                        Text("Balance :")
                                             .font(.system(size: 18, weight: .semibold))
                        Spacer()
                        Text("$5,000")
                            .font(.system(size: 18, weight: .semibold))
                                            
                    }
                   
                    .padding()
                    List {
                        
                        ForEach(0..<5) { _ in
                            VStack(alignment:.leading) {
                                HStack {
                                    Text("Card name")
                                    Spacer()
                                    Text("Money")
                                }
                               
                                
                                Text("Date")
                            }
                        }
                    }
                }
//                .background(.red)
                .frame(height: 700)
            }
           
            .navigationTitle("Credit Cards")
            
        }
    }
    
    struct CreditCardView: View {
        
        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text("Apple Blue Visa Card")
                    .font(.system(size: 24, weight: .semibold))
                
                HStack {
                    Image("visa")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 44)
                        .clipped()
//                    Spacer()
//                    Text("Balance: $5,000")
//                        .font(.system(size: 18, weight: .semibold))
                }
                
                HStack {
                    Text("1234")
                        .font(.system(size: 28, weight: .semibold))
                    Text("****")
                        .font(.system(size: 28, weight: .semibold))
                    Text("****")
                        .font(.system(size: 28, weight: .semibold))
                    Text("1234")
                        .font(.system(size: 28, weight: .semibold))
                        
                }
                
               
//                Spacer()
                Text("Credit Limit: $50,000")
                
                HStack { Spacer() }
            }
            .foregroundColor(.white)
            .padding()
            .background(
                
            LinearGradient(colors: [
                Color.blue.opacity(0.6),
                Color.blue
            ], startPoint: .center, endPoint: .bottom))
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.5), lineWidth: 1)
            )
            .cornerRadius(8)
            .shadow(radius: 5)
            .padding(.horizontal)
            .padding(.top, 8)
        }
    }
    
}
#Preview {
    CardsView()
}
