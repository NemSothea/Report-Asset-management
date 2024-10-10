//
//  CustomDonutChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import SwiftUI
import Charts

struct BarMarkChartView: View {
    var accountTypes = AccountType.allBarChart

    @State private var animationProgress: CGFloat = 0
    @State private var selectedAccountType: AccountType?

    let sortAccountTypes = AccountType.allBarChart.sorted { $0.reportRate > $1.reportRate }

    var body: some View {
        VStack {
            Chart {
                ForEach(accountTypes) { accountType in
                    // Compute adjustedReportRate outside the BarMark
                    let adjustedReportRate = accountType.reportRate * Int(animationProgress)

                    BarMark(
                        x: .value("AccountType", accountType.name),
                        y: .value("ReportRate", adjustedReportRate)
                    )
                    .opacity(selectedAccountType == nil || selectedAccountType == accountType ? 0.8 : 0.7)
                    .foregroundStyle(accountType.color)
                    .cornerRadius(12)

                    .annotation(position: .top) {
                        if selectedAccountType == accountType {
                            Text("\(Int(accountType.reportRate))%")
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(5)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(5)
                        }
                    }
                }
            }
            .chartYScale(domain: 0...100)
            .aspectRatio(1, contentMode: .fit)
            .onAppear {
                withAnimation(.easeOut(duration: 1.0)) {
                    animationProgress = 1.0
                }
            }
            .onDisappear {
                animationProgress = 0
            }
            .chartOverlay { proxy in
                GeometryReader { geometry in
                    Rectangle().fill(Color.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            // Deselect when tapping outside the bars
                            selectedAccountType = nil
                        }
                }
            }
            .chartOverlay { proxy in
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded { value in
                                    let location = value.location
                                    // Convert the location to chart coordinates
                                    let chartX = location.x - geometry[proxy.plotFrame!].origin.x
                                    // Get the x-axis value at the tapped location
                                    if let xValue: String = proxy.value(atX: chartX) {
                                        // Find the account type that matches the x-axis value
                                        if let accountType = accountTypes.first(where: { $0.name == xValue }) {
                                            if selectedAccountType == accountType {
                                                selectedAccountType = nil
                                            } else {
                                                selectedAccountType = accountType
                                            }
                                        }
                                    } else {
                                        selectedAccountType = nil
                                    }
                                }
                        )
                }
            }
            .padding()

            // Legend for the bar chart
            List(sortAccountTypes) { item in
                HStack {
                    Circle()
                        .fill(item.color)
                        .frame(width: 10, height: 10)

                    Text(item.name)
                        .font(.subheadline)
                    Spacer()
                    Text("\(Int(item.reportRate))%")
                        .fontWeight(.bold)
                        .foregroundColor(item.color)
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
