//
//  CustomDonutChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import SwiftUI
import Charts

// Bar chart view
struct BarMarkChartView: View {
    
    var accountTypes                        = AccountType.allBarChart
    
    @State private var animationProgress    : CGFloat = 0
    
    let sortAccountTypes  = AccountType.allBarChart.sorted { $0.reportRate > $1.reportRate }
    
    @State private var averageIsShown = false
    
 
       var body: some View {
           VStack {
               Chart {
                   ForEach(accountTypes) {
                       BarMark(x: .value("ReportRate", $0.name),
                               y: .value("AccountType", $0.reportRate * Int(animationProgress))
                       )
                       .opacity(0.8)
                       .foregroundStyle($0.color)
                       .cornerRadius(12)
                   }
               }
               .chartYScale(domain: 0...100)// for 100%
           
               .aspectRatio(1, contentMode: .fit)
               
               
               .onAppear {
                   withAnimation(.easeOut(duration: 1.0)) {
                          animationProgress = 1.0
                      }
               }
               .onDisappear {
                   animationProgress = 0
                  
               }
               
               // Legend for the donut chart
               .padding()
               List(sortAccountTypes) { item in
                   HStack {
                       Circle()
                           .fill(item.color)
                           .frame(width: 10, height: 10)
                       
                       Text(item.name)
                           .font(.subheadline)
                       Spacer()
                       Text("\(item.reportRate) %")
                           .fontWeight(.bold)
                           .foregroundStyle(item.color)
                   }
                   .padding(.vertical, 4)
               }
               .listStyle(PlainListStyle())
               .frame(height: 220)

           }
           .padding()
       }
    
}


#Preview {
    BarMarkChartView()
}
