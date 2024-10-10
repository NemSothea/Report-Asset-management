//
//  CustomDonutChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import SwiftUI

struct AnnotatedCircleView: View {
    
    let accountType : AccountType
    var isSelected  : Bool = false
    
    var body: some View {
        let outerInnerCircleSize: CGFloat = isSelected ? 105 : 0
        
        ZStack {
            Circle()
                .fill(.gray.shadow(.drop(color: .black, radius: 1)))
                .frame(width: outerInnerCircleSize, height: outerInnerCircleSize)
                .overlay(
                    Circle()
                        .fill(.white)
                        .overlay(
                            VStack(alignment: .center) {
                                Text("\(accountType.name)")
                                    .foregroundStyle(.gray)
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                                
                                Text("\(accountType.reportRate) %")
                                    .foregroundStyle(.pink)
                                    .bold()
                            }
                        )
                )
        }
    }
}

#Preview {
    AnnotatedCircleView(accountType: AccountType(name: "TOP-UP", reportRate: 1000, color: .topup, text: "TOP-UP", balance: 1000.0, year: 2023), isSelected: true)
}
