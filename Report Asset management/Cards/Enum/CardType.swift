//
//  CardType.swift
//  Report Asset management
//
//  Created by sothea007 on 20/9/24.
//

import SwiftUI

enum CardType: String, CaseIterable, Identifiable {
    case masterCard = "MasterCard"
    case visa = "Visa"
    case amex = "Amex"
    case discover = "Discover"
    case dinersClubOrCarteBlanche = "Diner's Club/Carte Blanche"
    case unknown
    
    public init(number: String?) {
        guard let count = number?.count, count >= 14 else {
            self = .unknown
            return
        }
        switch number?.first {
        case "3":
            if count == 15 {
                self = .amex
            } else if count == 14 {
                self = .dinersClubOrCarteBlanche
            } else {
                self = .unknown
            }
        case "4": self = (count == 13 || count == 16) ? .visa : .unknown
        case "5": self = count == 16 ? .masterCard : .unknown
        case "6": self = count == 16 ? .discover : .unknown
        default: self = .unknown
        }
    }
    
    public var id: Int { hashValue }
    
    public var image: Image? {
        switch self {
        case .masterCard: return Image("mastercard-\(Color.isDarkInterfaceStyle ? "white" : "dark")-bg")
        case .visa: return Image("visa")
        case .amex: return Image("amex")
        case .discover: return Image("discover")
        case .dinersClubOrCarteBlanche: return Image("dinersclub")
        case .unknown: return nil
        }
    }
}
