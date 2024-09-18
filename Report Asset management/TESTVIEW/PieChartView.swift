//
//  PieChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI
import Charts

struct PostCount : Identifiable {
    let id = UUID()
    var category: String
    var count   : Int
    var angle   : CGFloat
}
struct PieChartView: View {
    
    @State var byCategory: [PostCount] = [
        .init(category: "Deposit and withdrawal savings", count: 79, angle: 0.0),
        .init(category: "Deposit and savings", count: 65, angle: 0.0),
        .init(category: "Card", count: 58, angle: 0.0),
        .init(category: "Loan", count: 15, angle: 0.0),
        .init(category: "Top-up", count: 9, angle: 0.0)
     ]
    @State private var selectedIndex: Int? = nil
    @State private var selectedCategory: String? = nil
  
    
    var body: some View {
        VStack {
        
                Chart(Array(byCategory.enumerated()),id:\.1.id) { index,item in
                    SectorMark(
                        angle: .value("Count", item.count),
                        innerRadius: .ratio(0.5),
                        angularInset: 0.4)
                    .cornerRadius(5)
                        .foregroundStyle(by: .value("Category", item.category))
                        
                        .annotation(position: .overlay/*,alignment: .center*/) {
                            let outerInnerCircleSize : CGFloat = (index == 0 || index == 1) ? 105 : 55
                         
                            Circle()
                        
                                .fill(.gray.shadow(.drop(color: .black, radius: 1)))
                                .frame(width: outerInnerCircleSize, height: outerInnerCircleSize)
                                
                                .overlay(
                                    Circle()
                                        .fill(.white)
                                        .frame(width: outerInnerCircleSize, height: outerInnerCircleSize)
                                       
                                        .overlay(
                                            VStack {
                                                Text(" \(item.category) ")
                                                .foregroundStyle(.gray)
                                                .font(.caption2)
                                                .multilineTextAlignment(.center)
                                                
                                                    Text("\(item.count) %")
                                                     .foregroundStyle(.pink)
                                                     .font(.caption2)
                                            }
                                        )
                                )
                        }
                        
                }
                
            .chartLegend(.hidden)
            .frame(width: 300,height: 350)
            .chartBackground(content: { proxy in
                Text("🔔")
                    .font(.system(size: 50))
            })
            
            
            List(byCategory) { item in
                HStack {
                    Circle()
                        .fill(color(for: item.category))
                        .frame(width: 10, height: 10)
                    
                    Text(item.category)
                        .font(.subheadline)
                }
                .padding(.vertical,4)
            }
            .listStyle(PlainListStyle())
            .frame(width: 300,height: 350)
        }
        
    }
    
    // Function to Map Categories to Colors
    func color(for category: String) -> Color {
        switch category {
        case "Deposit and withdrawal savings":
            return .green
        case "Deposit and savings":
            return .blue
        case "Card":
            return .yellow
        case "Loan":
            return .purple
        default:
            return .red
        }
    }
 
}

#Preview {
    PieChartView()
}
