//
//  File.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import Foundation
import SwiftUI

struct AccoutType: Identifiable {
    
    let name        : String
    let reportRate  : Int
    let color       : Color
    let text        : String
    let balance     : Float
    
    var id          : String {
        name
    }
    
    static var all: [AccoutType] {
        [
            .init(name: "Deposit and withdrawal savings", reportRate:
                    20, color: .withdraw, text: "Deposit and withdrawal savings", balance: 100.30),
            .init(name: "Deposit and savings", reportRate: 20, color: .deposit, text: "Deposit and savings", balance: 120.0),
            .init(name: "Card", reportRate: 10, color: .card, text: "Card", balance: 1000.60),
            .init(name: "Loan", reportRate: 15, color: .load, text: "Loan", balance: 5000.0),
            .init(name: "Top-up", reportRate: 30, color: .topup, text: "Top-up", balance: 989.80)
            
        ]
    }
}
