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
                    .frame(width: 79,height: 79)
                    .padding()
                VStack(alignment:.leading,spacing: -5) {
                    Text("My Asset Status")
                        .font(.title)
                    HStack {
                        Text(" 128.40")
                            .font(.title2)
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
