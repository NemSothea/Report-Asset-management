//
//  CustomDonutChartView.swift
//  Report Asset management
//
//  Created by sothea007 on 18/9/24.
//

import SwiftUI


struct RootView: View {
    
    // Hold the state for which tab is active/selected
    @State var selection: Int = 0
    
    var body: some View {
        
       // Align the overlay to bottom to ensure tab bar stays pinned.
        ZStack {
            // Your native TabView here
            TabView(selection: $selection) {
                BookUsView()
                    .tag(0)
                
                MyProfileView()
                    .tag(1)
                
                MenuView()
                    .tag(2)
            }
            .cornerRadius(3.0)
            .overlay( // Overlay the custom TabView component here
                Color.red // Base color for Tab Bar
                    .edgesIgnoringSafeArea(.vertical)
                    .frame(height: 50) // Match Height of native bar
                    .overlay(HStack {
                        Spacer()
                        
                        // First Tab Button
                        Button(action: {
                            self.selection = 0
                        }, label: {
                            Image(systemName: "house.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                                .opacity(selection == 0 ? 1 : 0.4)
                        })
                        Spacer()
                        
                        // Second Tab Button
                        Button(action: {
                            self.selection = 1
                        }, label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                                .opacity(selection == 1 ? 1 : 0.4)
                        })
                        
                        Spacer()
                        
                        // Third Tab Button
                        Button(action: {
                            self.selection = 2
                        }, label: {
                            Image(systemName: "gear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                                .opacity(selection == 2 ? 1 : 0.4)
                        })
                        Spacer()
                        
                    })
            ,alignment: .bottom)
        }
    }
}


#Preview {
    RootView()
}
