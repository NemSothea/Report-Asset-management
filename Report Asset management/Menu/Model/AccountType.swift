//
//  File.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import Foundation
import SwiftUI

struct AccountType: Identifiable,Equatable {
    
    let name        : String
    let reportRate  : Int
    let color       : Color
    let text        : String
    let balance     : Float
    let year        : Int
    
    var id          : String {
        name
    }
    
    static var all: [AccountType] {
        [
            .init(name: "Deposit and withdrawal", reportRate:
                    20, color: .withdraw, text: "Deposit and withdrawal savings", balance: 100.30, year: 2021),
            .init(name: "Deposit and savings", reportRate: 20, color: .deposit, text: "Deposit and savings", balance: 120.0, year: 2021),
            .init(name: "Card", reportRate: 10, color: .card, text: "Card", balance: 1000.60, year: 2021),
            .init(name: "Loan", reportRate: 15, color: .load, text: "Loan", balance: 5000.0, year: 2021),
            .init(name: "Top-Up", reportRate: 30, color: .topup, text: "Top-up", balance: 989.80, year: 2021)
            
        ]
    }
    
    static var allBarChart: [AccountType] {
        [
            .init(name: "Deposit and withdrawal", reportRate:
                    50, color: .withdraw, text: "Deposit and withdrawal savings", balance: 100.30, year: 2022),
            .init(name: "Deposit and savings", reportRate: 20, color: .deposit, text: "Deposit and savings", balance: 120.0, year: 2022),
            .init(name: "Card", reportRate: 10, color: .card, text: "Card", balance: 1000.60, year: 2022),
            .init(name: "Loan", reportRate: 15, color: .load, text: "Loan", balance: 5000.0, year: 2022),
            .init(name: "Top-Up", reportRate: 70, color: .topup, text: "Top-up", balance: 989.80, year: 2022)
            
        ]
    }
    // For line  chart data
    
    static var allDepositWithdraw: [AccountType] {
        [
            .init(name: "Deposit and withdrawal", reportRate:
                    0, color: .withdraw, text: "Deposit and withdrawal savings", balance: 100.30, year: 2021),
            .init(name: "Deposit and withdrawal", reportRate:
                    5, color: .withdraw, text: "Deposit and withdrawal savings", balance: 100.30, year: 2022),
            .init(name: "Deposit and withdrawal", reportRate:
                    25, color: .withdraw, text: "Deposit and withdrawal savings", balance: 100.30, year: 2023),
            .init(name: "Deposit and withdrawal", reportRate:
                    30, color: .withdraw, text: "Deposit and withdrawal savings", balance: 100.30, year: 2024)
        ]
    }
    static var allDepositWithSaving: [AccountType] {
        [
            .init(name: "Deposit and savings", reportRate: 0, color: .deposit, text: "Deposit and savings", balance: 120.0, year: 2021),
            .init(name: "Deposit and savings", reportRate: 10, color: .deposit, text: "Deposit and savings", balance: 120.0, year: 2022),
            .init(name: "Deposit and savings", reportRate: 25, color: .deposit, text: "Deposit and savings", balance: 120.0, year: 2023),
            .init(name: "Deposit and savings", reportRate: 40, color: .deposit, text: "Deposit and savings", balance: 120.0, year: 2024)
        ]
    }
    
    static var allCard: [AccountType] {
        [
            .init(name: "Card", reportRate: 0, color: .card, text: "Card", balance: 1000.60, year: 2021),
            .init(name: "Card", reportRate: 50, color: .card, text: "Card", balance: 1000.60, year: 2022),
            .init(name: "Card", reportRate: 75, color: .card, text: "Card", balance: 1000.60, year: 2023),
            .init(name: "Card", reportRate: 100, color: .card, text: "Card", balance: 1000.60, year: 2024),
        ]
    }
    
    static var allLoan: [AccountType] {
        [
            .init(name: "Loan", reportRate: 0, color: .load, text: "Loan", balance: 5000.0, year: 2021),
            .init(name: "Loan", reportRate: 25, color: .load, text: "Loan", balance: 5000.0, year: 2022),
            .init(name: "Loan", reportRate: 50, color: .load, text: "Loan", balance: 5000.0, year: 2023),
            .init(name: "Loan", reportRate: 75, color: .load, text: "Loan", balance: 5000.0, year: 2024)
        ]
    }
    static var allTopUp: [AccountType] {
        [
            .init(name: "Top-Up", reportRate: 20, color: .topup, text: "Top-Up", balance: 5000.0, year: 2021),
            .init(name: "Top-Up", reportRate: 20, color: .topup, text: "Top-Up", balance: 5000.0, year: 2022),
            .init(name: "Top-Up", reportRate: 50, color: .topup, text: "Top-Up", balance: 5000.0, year: 2023),
            .init(name: "Top-Up", reportRate: 100, color: .topup, text: "Top-Up", balance: 5000.0, year: 2024)
        ]
    }
    
    
}
