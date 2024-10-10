//
//  MenuView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct MenuView: View {
    
    @State private var favoriteColor = 0
    
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            // Profile view
            HeaderView()
           
            VStack(alignment:.leading,spacing: 10) {
                Text("Please selecte the chart type :")
                    .font(.headline)
                
                Picker("Account Chart", selection: $favoriteColor) {
                    Text("01").tag(0)
                    Text("02").tag(1)
                    Text("03").tag(2)
                    Text("04").tag(3)
                    Text("05").tag(4)
                }
                .pickerStyle(.segmented)
            }
            .padding()
            // Segment
            VStack(alignment:.leading,spacing: 10) {
                
               
                
                switch favoriteColor {
                case 0:
                    defaultChart01()
                case 1:
                    defaultChart02()
                case 2:
                    defaultChart03()
                case 3:
                    defaultChart04()
                default:
                    defaultChart05()
                }
                
            }
           
            
        }
    }
    // defaultChart01
    @ViewBuilder
    private func defaultChart01() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                DefaultDonutChartView()
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.report)
                            .shadow(radius: 5)
                    )
                
                // Asset list view
                AssetListView()
            }
            .padding()
            .background(Color(.systemGray6))
        }
    }
    // defaultChart02
    @ViewBuilder
    private func defaultChart02() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                // DefaultBackgroundDonutChartView
                DefaultBackgroundDonutChartView()
                

                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.report)
                            .shadow(radius: 5)
                    )
                
                // Asset list view
                AssetListView()
            }
            .padding()
            .background(Color(.systemGray6))
        }
    }
    // defaultChart03
    @ViewBuilder
    private func defaultChart03() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                // Donut chart view
                CustomDonutChartView()

                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.report)
                            .shadow(radius: 5)
                    )
                
                // Asset list view
                AssetListView()
            }
            .padding()
            .background(Color(.systemGray6))
        }
    }
    
    // defaultChart04
    @ViewBuilder
    private func defaultChart04() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                // Donut chart view
                BarMarkChartView()

                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.report)
                            .shadow(radius: 5)
                    )
                
                // Asset list view
                AssetListView()
            }
            .padding()
            .background(Color(.systemGray6))
        }
    }
    
    // defaultChart05
    @ViewBuilder
    private func defaultChart05() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                // Donut chart view
                lineMarkChartView()

                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.report)
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

#Preview {
    MenuView()
}
