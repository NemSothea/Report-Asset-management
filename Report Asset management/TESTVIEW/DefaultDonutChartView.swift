//
//  CustomDonutChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import SwiftUI
import Charts


// Donut chart view
struct DefaultDonutChartView: View {
    
    var accountTypes                        = AccountType.all
    @State private var selectedCount        : Int?
    @State private var selectedAccountType : AccountType?
    
    @State private var animationProgress    : CGFloat = 0
    
    let sortAccountTypes  = AccountType.all.sorted { $0.reportRate > $1.reportRate }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("My asset report")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            // Donut Chart
            Chart(accountTypes) { accountType in
                SectorMark(
                    angle: .value("reportRate",  accountType.reportRate * Int(animationProgress)),
                    innerRadius: .ratio(0.5),
                    outerRadius: MarkDimension(floatLiteral: getOuterRadius(for: accountType)),
                    angularInset: 0.2
                )
              
                .foregroundStyle(accountType.color)
                .cornerRadius(5)
                .annotation(position: .overlay) {
                    Text("\(accountType.reportRate) %")
                        .bold()
                        .foregroundStyle(.text)
                }
            }
            .frame(height: 350)
            .offset(y: -30.0)
            .chartAngleSelection(value: $selectedCount)
           
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
    private func getOuterRadius(for account: AccountType) -> CGFloat {
        let baseRadius: CGFloat     = 130
        let selectedRadius: CGFloat = 140
        
        if selectedAccountType?.name == account.name {
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
    DefaultDonutChartView()
}
