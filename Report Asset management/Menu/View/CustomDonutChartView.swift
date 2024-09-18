//
//  CustomDonutChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import SwiftUI
import Charts


// Donut chart view
struct CustomDonutChartView: View {
    
    var wineTypes                       = AccoutType.all
    @State private var selectedCount    : Int?
    @State private var selectedWineType : AccoutType?
    
    @State private var animationProgress: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("My asset report")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            // Donut Chart
            Chart(wineTypes) { wineType in
                SectorMark(
                    angle: .value("reportRate",  wineType.reportRate * Int(animationProgress)),
                    innerRadius: .ratio(0.5),
                    outerRadius: MarkDimension(floatLiteral: getOuterRadius(for: wineType)),
                    angularInset: 0.2
                )
              
                .foregroundStyle(wineType.color)
                .cornerRadius(5)
                .annotation(position: .overlay) {
                    let xCase: CGFloat = positionXY(value: wineType.color).0
                    let yCase: CGFloat = positionXY(value: wineType.color).1
                    AnnotatedCircleView(wineType: wineType, isSelected: selectedWineType?.name == wineType.name)
                        .offset(x: xCase, y: yCase)
                    
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
                selectedWineType = nil
            }
            // Legend for the donut chart
            List(wineTypes) { item in
                HStack {
                    Circle()
                        .fill(item.color)
                        .frame(width: 10, height: 10)
                    
                    Text(item.name)
                        .font(.subheadline)
                }
                .padding(.vertical, 4)
            }
            .listStyle(PlainListStyle())
            .frame(height: 220)
            .offset(y: -10.0)
        }
    }
    
    private func positionXY(value: Color) -> (CGFloat , CGFloat) {
        switch value {
        case .topup:
            return (-30.0, 0.0)
        case .deposit:
            return (20.0, 10.0)
        case .withdraw:
            return (20.0, -15.0)
        case .load:
            return (-10.0, 20.0)
        case .card:
            return (10.0, 30.0)
        default:
            return (0.0, 0.0)
        }
    }
    // Function to calculate the outer radius
    private func getOuterRadius(for wineType: AccoutType) -> CGFloat {
        let baseRadius: CGFloat     = 130
        let selectedRadius: CGFloat = 140
        
        if selectedWineType?.name == wineType.name {
            return selectedRadius
        } else {
            return baseRadius
        }
    }
    private func getSelectedWineType(value: Int) {
          withAnimation(.easeInOut(duration: 0.3)) {
              var cumulativeTotal = 0
              for wineType in wineTypes {
                  cumulativeTotal += wineType.reportRate
                  if value <= cumulativeTotal {
                      selectedWineType = wineType
                      break
                  }
              }
          }
      }
}


#Preview {
    CustomDonutChartView()
}
