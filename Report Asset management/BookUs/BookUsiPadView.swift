//
//  BookUsView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct BookUsiPadView: View {
    
    @State private var date = Date()
    
    var body: some View {
        NavigationSplitView {
            VStack {
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()
            }
            Spacer()
            .navigationTitle("Book Us")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    addCardButton
                }
            }
            
        } detail: {
            Text("Select a date to view details")
                .font(.title)
                .foregroundColor(.secondary)
        }
        
      
    }
    
    var addCardButton: some View {
        Button(action: {
            
        }, label: {
            Text("+ Add new")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .background(.pink)
                .cornerRadius(5)
        })
    }
}

#Preview {
    BookUsiPadView()
}
