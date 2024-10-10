//
//  lineMarkChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import SwiftUI
import Charts

// lineMark Chart View
struct lineMarkChartView: View {
    
    //MARK: - Properties
    let allDepositWithdraw      = AccountType.allDepositWithdraw
    let allCard                 = AccountType.allCard
    let allLoan                 = AccountType.allLoan
    let allDepositWithSaving    = AccountType.allDepositWithSaving
    let allTopUp                = AccountType.allTopUp
    
//    @State private var selectedCount        : Int?
    @State private var animationProgress    : CGFloat = 0
 
    
    var data : [(type : String, account : [AccountType])] {
        [
            (type : "DepositWithdraw", account : allDepositWithdraw),
            (type : "Card", account : allCard),
            (type : "Loan", account : allLoan),
            (type : "DepositWithSaving", account : allDepositWithSaving),
            (type : "TopUp", account : allTopUp)
        ]
    }
    
    //MARK: - Content
       var body: some View {
           VStack(spacing:10) {
               
               Chart(data,id:\.type) { datatype in
                  
                   ForEach(datatype.account) {
                       LineMark(x: .value("Year", $0.year), y: .value("ReportRate", $0.reportRate))

                   }
                   .foregroundStyle(by: .value("Account type", datatype.type))
                   .symbol(by: .value("Account type", datatype.type))
                  
               }
             
               .chartXScale(domain: 2021...2024)
               .chartYScale(domain: 0...120)
               .aspectRatio(1, contentMode: .fit)
               .offset(x: 2)
               .mask(
                GeometryReader { geometry in
                    Rectangle()
                        .frame(width: geometry.size.width * animationProgress, height: geometry.size.height)
                }
               )
               
               .onAppear {
                   withAnimation(.easeOut(duration: 2.0)) {
                       animationProgress = 1.0
                   }
               }
           }
           
           .padding()
       }
}


#Preview {
    lineMarkChartView()
}
