//
//  ContentView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @State private var isLoading: Bool = true  // Initially true to show loading

    var body: some View {
        ZStack {
            // Show loading view if isLoading is true
            if isLoading {
                VStack {
                    HUBView(dotSize: 15.0, timing: 0.2, loadingType: .dotScalling)
                }
            } else {
                // Show the CustomTabView when loading is complete
                VStack {
                    Spacer()
                    
                    CustomTabView(tabs: [
                        TabItemData(image: "calendar", selectedImage: "calendar", title: "Book Us"),
                        TabItemData(image: "creditcard", selectedImage: "creditcard.fill", title: "Cards"),
                        TabItemData(image: nil, selectedImage: nil, title: nil),
                        TabItemData(image: nil, selectedImage: nil, title: nil),
                        TabItemData(image: "person.crop.circle", selectedImage: "person.crop.circle.fill", title: "Profile"),
                        TabItemData(image: "list.dash", selectedImage: "list.dash", title: "Menu")
                    ], selectedIndex: $selectedTab) { index in
                        getViewForTab(index: index)
                    }
                }
            }
        }
        .onAppear {
            // Simulate a delay for loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isLoading = false // Hide loading and show the CustomTabView
            }
        }
    }
    
    @ViewBuilder
    private func getViewForTab(index: Int) -> some View {
        if index == 0 {
            if UIDevice.current.userInterfaceIdiom == .pad {
                BookUsiPadView()
            } else {
                BookUsView()
            }
        } else if index == 1 {
            if UIDevice.current.userInterfaceIdiom == .pad {
                CardsiPadView()
            } else {
                CardsView()
            }
        } else if index == 2 {
            // Scan
            EmptyView()
        } else if index == 3 {
            // Add other logic
            EmptyView()
        } else if index == 4 {
            MyProfileView()
        } else if index == 5 {
            MenuView()
        } else {
            EmptyView()
        }
    }
}


#Preview {
    ContentView()
}
