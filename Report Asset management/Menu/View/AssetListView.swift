//
//  CustomDonutChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import SwiftUI

// Asset list view
struct AssetListView : View {
    
    let assetItems = AccoutType.all
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("My asset list")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
                .padding(.top, 20)
            
            // List of assets
            ForEach(assetItems) { item in
                VStack {
                    HStack {
                        Text(item.name)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.listText)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Balance")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        
                        Text("\(String(format: "%.2f",item.balance))")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.listText)
                        Text("USD")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                    }
                    
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.asset)
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
        }
        .background(Color(.systemGray6)) // Light gray background
    }
}

#Preview {
    AssetListView()
}
