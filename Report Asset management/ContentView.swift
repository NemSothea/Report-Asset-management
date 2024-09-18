//
//  ContentView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndex : Int = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.tabBackground
    }
    
    var body: some View {
        TabView(selection : $selectedIndex) {
            
            //Book Us Tap
            NavigationStack {
                BookUsView()
                    .navigationTitle("BookUs")
            }
            
            .tabItem {
                Text("Book Us")
                Image(systemName: "calendar")
                    .renderingMode(.template)
            }
            .tag(0)
            //Cards Tap
            NavigationStack {
                CardsView()
                    .navigationTitle("Cards")
            }
            
            .tabItem {
                Text("Cards")
                Image(systemName: "creditcard")
                    .renderingMode(.template)
            }
            .tag(1)
            
            //Scan Tap
            NavigationStack {
                ScanView()
                   
            }
            
            .tabItem {
                Text("Scan")
                Image(systemName: "qrcode.viewfinder")
                    .renderingMode(.template)
            }
            .tag(2)
            
            //Profile Tap
            NavigationStack {
                CardsView()
                    .navigationTitle("Profile")
            }
            
            .tabItem {
                Text("Profile")
                Image(systemName: "person.crop.circle")
                    .renderingMode(.template)
            }
            .tag(3)
            
            //Menu Tap
            NavigationStack {
                MenuView()
                  
            }
            
            .tabItem {
                Text("Menu")
                Image(systemName: "list.dash")
                    .renderingMode(.template)
            }
            .tag(4)
        }
        .background()
    }
}

#Preview {
    ContentView()
}
