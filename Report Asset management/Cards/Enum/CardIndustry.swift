//
//  File.swift
//  Report Asset management
//
//  Created by sothea007 on 20/9/24.
//

import Foundation

enum CardIndustry: String, CaseIterable, Identifiable {
    
    case industry                   = "ISO/TC 68 and other industry assignments"
    case airlines                   = "Airlines"
    case airlinesFinancialAndFuture = "Airlines, financial and other future industry assignments"
    case travelAndEntertainment     = "Travel and entertainment"
    case bankingAndFinancial        = "Banking and financial"
    case merchandisingAndBanking    = "Merchandising and banking/financial"
    case petroleum                  = "Petroleum and other future industry assignments"
    case healthcareAndTelecom       = "Healthcare, telecommunications and other future industry assignments"
    case national                   = "For assignment by national standards bodies"
    case unknown
    
    public init(firstDigit: String.Element?) {
        switch firstDigit {
        case "0": self      = .industry
        case "1": self      = .airlines
        case "2": self      = .airlinesFinancialAndFuture
        case "3": self      = .travelAndEntertainment
        case "4", "5": self = .bankingAndFinancial
        case "6": self      = .merchandisingAndBanking
        case "7": self      = .petroleum
        case "8": self      = .healthcareAndTelecom
        case "9": self      = .national
        default: self       = .unknown
        }
    }
    
    public var id: Int { hashValue }
}
