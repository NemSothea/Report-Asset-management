//
//  BookUsView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct BookUsView: View {
    
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            HStack {
                DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
             
            }
            .offset(y:-50)
            .navigationTitle("Book Us")
            .navigationBarItems(trailing: addCardButton)
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
    BookUsView()
}
