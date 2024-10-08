//
//  ContentView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct TabItemView: View {
    
    let data            : TabItemData
    let isSelected      : Bool
    
    var body: some View {
        VStack {
            Image(systemName: (isSelected ? data.selectedImage : data.image) ?? "")

                .font(.system(size: 20))
                .foregroundColor(isSelected ? .black : .gray)
                .onAppear{
                    withAnimation(.easeInOut){
                        
                    }
                }
            
            Spacer().frame(height: 4)
            
            Text(data.title ?? "")
                .foregroundColor(isSelected ? .black : .gray)
                .font(.system(size: 11))
        }
    }
}
