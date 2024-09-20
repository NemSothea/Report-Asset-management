//
//  MyProfileView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct profileModel : Identifiable {
    
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
    
    static var all: [profileModel] {
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

struct MyProfileView: View {
    
    let profile  = profileModel.all
   
    var body: some View {
        
        VStack {
            if let profile = profile.first {
                HeaderProfileView(header: profile)
                ListProfileView(settingList: profile.setting)
            }
          
        }
    }
}
struct ListProfileView : View {
   
    let settingList : [profileModel.Setting]
    
    var body: some View {
        
        List(settingList) { item in
            HStack {
                Image(systemName: item.settingimg)
                    .resizable()
                    .frame(width: 25,height: 25)
                    .foregroundColor(item.settingColor)
                Text(" \(item.settingTitle)")
                    .font(.headline)
            }
            .padding(10)
        }
    }
}



struct HeaderProfileView : View {
    
    let header : profileModel?
    
    var body: some View {
       
        VStack {
            VStack {
                
                Image(systemName: header?.img ?? "")
                    .resizable()
                    .frame(width: 69,height: 69)
                HStack {
                    Text("\(header?.name ?? "")".uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                    Button {
                        
                    } label : {
                        Image(systemName: "arrow.clockwise")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    
                }
                if let info = formatDateString(header?.loginInfo ?? "") {
                                  Text("Recent Login \(info)")
                                      .font(.caption)
                                      .padding(.bottom, 10)
                 }
            }
            
            HStack {
                VStack(alignment:.leading,spacing: 10) {
                    Spacer()
                    Text("Exchange Rate ")
                        .font(.caption)
                        .foregroundStyle(.text)
                    HStack {
                        Text("1")
                            .foregroundStyle(.text)
                            .fontWeight(.bold)
                            
                        Text("USD =")
                            .foregroundStyle(.text)
                             Text("\(String(format: "%.2f",header?.exchangeRate ?? 0.0))")
                            .font(.title)
                            .foregroundStyle(.text)
                            .fontWeight(.bold)
                        Text("KHR")
                            .font(.title)
                            .foregroundStyle(.text)
                    }
                   
                    Spacer()
                }
                .padding(.leading,30)
                Spacer()
            }
           
            .background(.exchange)
            .frame(width: UIScreen.main.bounds.width - 50,height: 130)
            .cornerRadius(20.0)
        }

    }
    // Function to format date string
    func formatDateString(_ dateString: String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "ddMMyyyyHHmmss"  // Expecting date in this format
        
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd/MMM/yyyy HH:mm"
            outputFormatter.locale = Locale(identifier: "en_US_POSIX")
            return outputFormatter.string(from: date)
        }
        
        return nil // Return nil if the string can't be formatted
    }
}

#Preview {
    MyProfileView()
}

