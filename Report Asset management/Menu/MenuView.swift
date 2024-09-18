//
//  MenuView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            // Profile view
        HeaderView()
         
        ScrollView {
                VStack(spacing: 20) { 
                    // DefaultBackgroundDonutChartView
#warning("TEST DefaultBackgroundDonutChartView")
//                    DefaultBackgroundDonutChartView()
                    
                    // Donut chart view
//                    CustomDonutChartView()
                    
                    // DefaultDonutChartView
                    #warning("TEST DefaultDonutChartView")
                    DefaultDonutChartView()
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.tabBackground)
                                .shadow(radius: 5)
                        )
                    
                    // Asset list view
                    AssetListView()
                }
                .padding()
                .background(Color(.systemGray6))
            }
         }
    }
}

#Preview {
    MenuView()
}
