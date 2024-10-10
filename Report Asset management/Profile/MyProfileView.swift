//
//  MyProfileView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct MyProfileView: View {
    
    //MARK: - Properties
    let profile     = ProfileModel.all
  
    
    // MARK: -  Content
    var body: some View {
        
        NavigationView {
          
            VStack {
                if let profile = profile.first {
                  
                    // HeaderProfileView
                    headerProfileView(header: profile)
                  
                        // ExchangeView
                        exchangeView(exchangeRate: profile.exchangeRate)
                        
                        // ListProfileView
                        listProfileView(listProfile: profile.setting)
                    }
                      

                
                   
            }
            .edgesIgnoringSafeArea(.all)
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
// MARK: - HeaderProfileView
extension MyProfileView {
    @ViewBuilder
    private func headerProfileView(header : ProfileModel?) -> some View {
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
        }
    }
    
}

// MARK: - ExchangeView
extension MyProfileView {
    
    @ViewBuilder
    private func exchangeView(exchangeRate : Float ) -> some View {
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
                    Text("\(String(format: "%.2f",exchangeRate))")
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


// MARK: - ListProfileView
extension MyProfileView {
    
    @ViewBuilder
    private func listProfileView(listProfile : [ProfileModel.Setting]) -> some View {
      
            List(listProfile) { item in
                HStack {
                    Image(systemName: item.settingimg)
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundColor(item.settingColor)
                    Text(" \(item.settingTitle)")
                        .font(.headline)
                }
                .padding(10)
                // If you need navigation, wrap content with NavigationLink
                            .contentShape(Rectangle()) // Ensure the entire row is tappable
                            .onTapGesture {
                                // Handle tap
                            }
            }
            .listStyle(PlainListStyle())
        
    }
}

#Preview {
    MyProfileView()
}

