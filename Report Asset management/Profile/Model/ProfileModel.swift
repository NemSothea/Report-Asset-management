//
//  ProfileModel.swift
//  Report Asset management
//
//  Created by sothea007 on 27/9/24.
//

import SwiftUI

struct ProfileModel : Identifiable {
    
    let     id          = UUID()
    let name            : String
    let img             : String
    let loginInfo       : String
    let exchangeRate    : Float
    
    let setting         : [Setting]
    
    struct Setting : Identifiable  {
        let     id             = UUID()
        let settingimg         : String
        let settingTitle       : String
        let settingColor       : Color
    }
    
    static var all: [ProfileModel] {
        [
            .init(name: "Sen Sina", img: "person.circle", loginInfo: "19022024105450", exchangeRate: 4063.70, setting: [
                Setting(settingimg: "gear.circle.fill", settingTitle: "Settings", settingColor: .gray),
                Setting(settingimg: "checkmark.shield.fill", settingTitle: "Security", settingColor: .blue),
                Setting(settingimg: "newspaper", settingTitle: "News/Event", settingColor: .purple),
                Setting(settingimg: "mappin.and.ellipse.circle.fill", settingTitle: "Find Branch & ATM/CDM", settingColor: .pink),
                Setting(settingimg: "ellipsis.circle.fill", settingTitle: "More Products", settingColor: .yellow),
                Setting(settingimg: "dollarsign.circle.fill", settingTitle: "Apply Loads", settingColor: .blue),
                Setting(settingimg: "australiandollarsign.circle.fill", settingTitle: "Exchage Rate", settingColor: .red),
                Setting(settingimg: "mail.stack.fill", settingTitle: "Contact Us", settingColor: .green),
            ])
        ]
    }
    
}
