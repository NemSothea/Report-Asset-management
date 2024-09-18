//
//  HeaderView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
     
        HStack(alignment:.center) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 69,height: 69)
                
                VStack(alignment:.leading) {
                    Text("My Asset Status")
                    HStack {
                        Text(" 128.40")
                            .bold()
                        Text("usd")
                    }
                }
        }
        .padding()
    }
}

#Preview {
    HeaderView()
}
