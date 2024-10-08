//
//  DonutChartSortedView.swift
//  PieChartApp
//
//  Created by Eric Callanan on 15/10/2023.
//

import SwiftUI
import Charts


struct IncomeData: Identifiable, Equatable {
    var category: String
    var amount: Double
    var id = UUID()
}

let totalIncomeData: [IncomeData] = [
    .init(category: "Donations and legacies", amount: 19.8),
    .init(category: "Trading activities", amount: 4.2),
    .init(category: "Charitable activities", amount: 2.4),
    .init(category: "Other and investment", amount: 0.2)
]

let donationsIncomeData: [IncomeData] = [
    .init(category: "Legacies", amount: 2.4),
    .init(category: "Other national campaigns and donations", amount: 5.5),
    .init(category: "Daffodil Day", amount: 4.7),
    .init(category: "Philanthropy and corporate partnerships", amount: 4.0),
    .init(category: "Individual giving", amount: 3.2)
]

let chartColors: [Color] = [
    Color(red: 0.55, green: 0.83 , blue: 0.78),
    Color(red: 1.00, green: 1.00 , blue: 0.70),
    Color(red: 0.75, green: 0.73 , blue: 0.85),
    Color(red: 0.98, green: 0.50 , blue: 0.45),
    Color(red: 0.50, green: 0.69 , blue: 0.83),
    Color(red: 0.99, green: 0.71 , blue: 0.38),
    Color(red: 0.70, green: 0.87 , blue: 0.41),
    Color(red: 0.99, green: 0.80 , blue: 0.90),
    Color(red: 0.85, green: 0.85 , blue: 0.85),
    Color(red: 0.74, green: 0.50 , blue: 0.74),
    Color(red: 0.80, green: 0.92 , blue: 0.77),
    Color(red: 1.00, green: 0.93 , blue: 0.44)
]

struct DonutChartSortedView: View {
    @State private var selectedAmount: Double? = nil
    let cumulativeIncomes: [(category: String, range: Range<Double>)]
    
    var donationsIncomeDataSorted = donationsIncomeData
    
    init() {
        donationsIncomeDataSorted.sort {
            $0.amount > $1.amount
        }

        var cumulative = 0.0
        self.cumulativeIncomes = donationsIncomeDataSorted.map {
            let newCumulative = cumulative + Double($0.amount)
            let result = (category: $0.category, range: cumulative ..< newCumulative)
            cumulative = newCumulative
            return result
        }
    }

    var selectedCategory: IncomeData? {
        if let selectedAmount,
           let selectedIndex = cumulativeIncomes
            .firstIndex(where: { $0.range.contains(selectedAmount) }) {
            return donationsIncomeDataSorted[selectedIndex]
        }
        return nil
    }
    
    var body: some View {
        VStack {
            GroupBox ( "2022 Donations and Legacies (€ million)") {
                Chart(donationsIncomeDataSorted) {
                    SectorMark(
                        angle: .value("Amount", $0.amount),
                        innerRadius: .ratio(selectedCategory == $0 ? 0.5 : 0.6),
                        outerRadius: .ratio(selectedCategory == $0 ? 1.0 : 0.9),
                        angularInset: 3.0
                    )
                    .cornerRadius(6.0)
                    .foregroundStyle(by: .value("category", $0.category))
                    
                    .opacity(selectedCategory == $0 ? 1.0 : 0.8)
                }
                // Set color for each data in the chart
                .chartForegroundStyleScale(
                    domain: donationsIncomeDataSorted.map  { $0.category },
                    range: chartColors
                )
                
                // Position the Legend
                .chartLegend(position: .top, alignment: .center)
                
                // Select a sector
                .chartAngleSelection(value: $selectedAmount)
                
                .chartBackground { chartProxy in
                    GeometryReader { geometry in
                        let frame = geometry[chartProxy.plotFrame!]
                        VStack(spacing: 0) {
                            Text(selectedCategory?.category ?? "")
                                .multilineTextAlignment(.center)
                                .font(.body)
                                .foregroundStyle(.secondary)
                                .frame(width: 120, height: 80)
                            Text("\(selectedCategory?.amount ?? 0, specifier: "%.1f")")
                                .font(.title.bold())
                                .foregroundColor((selectedCategory != nil) ? .primary : .clear)
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
                
            }
            .frame(height: 500)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DonutChartSortedView()
}
