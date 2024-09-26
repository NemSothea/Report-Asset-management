//
//  ContentView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//
import SwiftUI

struct CustomTabView<Content: View>: View {
    let tabs                    : [TabItemData]
    @Binding var selectedIndex  : Int
    @ViewBuilder let content    : (Int) -> Content

    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices, id: \.self) { index in
                    content(index)
                        .tag(index)
                }
              
            }
            
            VStack {
                Spacer()
                if UIDevice.current.userInterfaceIdiom == .mac {
                  // Will appy latter
                }else if UIDevice.current.userInterfaceIdiom == .pad {
                    TabBottomiPadView(tabbarItems: tabs, selectedIndex: $selectedIndex)
                }else {
                    TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
                }
             
                
            }
        }
        .edgesIgnoringSafeArea(.bottom) 
    }
}

