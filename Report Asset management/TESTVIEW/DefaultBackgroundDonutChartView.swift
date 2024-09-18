//
//  CustomDonutChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import SwiftUI
import Charts


// Donut chart view
struct DefaultBackgroundDonutChartView: View {
    
    var accountTypes                        = AccoutType.all
    @State private var selectedCount        : Int?
    @State private var selectedAccountType : AccoutType?
    
    @State private var animationProgress    : CGFloat = 0
    
    let sortAccountTypes  = AccoutType.all.sorted { $0.reportRate > $1.reportRate }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("My asset report")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            // Donut Chart
            Chart(accountTypes) { wineType in
                SectorMark(
                    angle: .value("reportRate",  wineType.reportRate * Int(animationProgress)),
                    innerRadius: .ratio(0.6),
                    outerRadius: MarkDimension(floatLiteral: getOuterRadius(for: wineType))
                )
               
                .foregroundStyle(wineType.color)
                
            }
            .frame(width: 350,height: 350)
            .offset(y: -30.0)
            .chartAngleSelection(value: $selectedCount)
            
            .chartBackground { _ in
                let isLongLenght = selectedAccountType?.name.count ?? 0 > 20 ? true : false
                
                if let selectedAccountType {
                    VStack(alignment:.center) {
                      
                        Text(isLongLenght ? "withdrawal savings".uppercased() : selectedAccountType.name.uppercased())
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        Text("\(selectedAccountType.reportRate) %")
                            .fontWeight(.bold)
                            .foregroundStyle(.pink)
                    }
                    .offset(y: -20.0)
                } else {
                    VStack {
                        Image(systemName: "accessibility.badge.arrow.up.right")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text("Select a AccoutType")
                            .font(.subheadline)
                    }
                    .offset(y: -40.0)
                }
            }
            .onChange(of: selectedCount) { oldValue, newValue in
                if let newValue {
                    withAnimation {
                        getSelectedWineType(value: newValue)
                    }
                }
            }
            
            .onAppear {
                withAnimation(.easeOut(duration: 1.0)) {
                       animationProgress = 1.0
                   }
            }
            .onDisappear {
                animationProgress = 0
                selectedAccountType = nil
            }
            // Legend for the donut chart
           
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
            .offset(y: -10.0)
        }
        .padding()
    }
    
   
    // Function to calculate the outer radius
    private func getOuterRadius(for wineType: AccoutType) -> CGFloat {
        let baseRadius: CGFloat     = 130
        let selectedRadius: CGFloat = 140
        
        if selectedAccountType?.name == wineType.name {
            return selectedRadius
        } else {
            return baseRadius
        }
    }
    private func getSelectedWineType(value: Int) {
          withAnimation(.easeInOut(duration: 0.3)) {
              var cumulativeTotal = 0
              for accountType in accountTypes {
                  cumulativeTotal += accountType.reportRate
                  if value <= cumulativeTotal {
                      selectedAccountType = accountType
                      break
                  }
              }
          }
      }
}


#Preview {
    DefaultBackgroundDonutChartView()
}
