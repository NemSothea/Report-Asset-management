//
//  ContentView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab : Int = 0
   
    
    var body: some View {
        VStack {
            
            Spacer()
            
            CustomTabView(tabs: [
                TabItemData(image: "calendar", selectedImage: "calendar", title: "Book Us"),
                TabItemData(image: "creditcard", selectedImage: "creditcard.fill", title: "Cards"),
                TabItemData(image: "", selectedImage: "", title: ""),
                TabItemData(image: "", selectedImage: "", title: ""),
                TabItemData(image: "person.crop.circle", selectedImage: "person.crop.circle.fill", title: "Profile"),
                TabItemData(image: "list.dash", selectedImage: "list.dash", title: "Menu")
            ], selectedIndex: $selectedTab) { index in
                if index == 0 {
                    BookUsView()
                } else if index == 1 {
                    CardsView()
                }else if index == 2 {
                    // Scan
                      
                }
                else if index == 3 {
                 
                } else if index == 4 {
                    MyProfileView()
                  
                }else if index == 5 {
                    MenuView()
                } else {
                    EmptyView()
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
