//
//  ContentView.swift
//  Report Asset management
//
//  Created by sothea007 on 16/9/24.
//

import SwiftUI

struct TabBottomView: View {
    
    @State private var isShowingSheet = false
    @State private var cardDetails : CardDetails? = nil
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
        @Environment(\.verticalSizeClass) var verticalSizeClas
    
    let tabbarItems             : [TabItemData]
    var height                  : CGFloat = 100
    var width                   : CGFloat = UIScreen.main.bounds.width - 5
    @Binding var selectedIndex  : Int
    
    var tabIndices: Range<Int> {
        return 0..<tabbarItems.count
    }
    
    var body: some View {
       
        
        VStack(alignment: .center) {
            VStack {
                VStack {
                Button {
                    isShowingSheet.toggle()
                } label: {

                    Image(systemName: "qrcode.viewfinder")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                     
                    }
                }
                .frame(width: 70, height: 70)
                    .background(Color.blue)
                    .cornerRadius(UIScreen.main.bounds.width / 2)
                    .shadow(radius: 5, x: 5, y: 0)
                    .zIndex(1.0)
                    .offset(y: horizontalSizeClass == .compact && verticalSizeClas == .regular ? (UIScreen.main.bounds.width / 2 - 115) : 50)
                    .padding()
                
                HStack {
                    Spacer()
                    
                    ForEach(tabIndices, id: \.self) { index in
                        let item = tabbarItems[index]
                        Button {
                            self.selectedIndex = index
                        } label: {
                            let isSelected = selectedIndex == index
                            TabItemView(data: item, isSelected: isSelected)
                        }
                        
                        Spacer()
                    }
                   
                }
                .frame(width: width, height: height)
                .background(.tabBackground)
                .cornerRadius(13)
                .shadow(radius: 5, x: 5, y: 0)
                }
           
        }
        .sheet(isPresented: $isShowingSheet) {
            CardReaderView() { cardDetails in
                 
                if let details = cardDetails {
                    self.cardDetails = details // Store card details
                    isShowingSheet = false // Close the sheet after scanning
                }
            }
        }
        .sheet(item: $cardDetails) { details in
            AddCardFormView(cardDetails: details) // Present AddCardFormView with the scanned card details
        }
        
    }
}
#Preview {
  
    @Previewable @State var selectedIndexX: Int = 0 // Declare as @State
       
       return TabBottomView(tabbarItems: [
           TabItemData(image: "calendar", selectedImage: "calendar.circle.fill", title: "Book Us"),
           TabItemData(image: "creditcard", selectedImage: "creditcard.fill", title: "Cards"),
           TabItemData(image: nil, selectedImage: "", title: ""),TabItemData(image: nil, selectedImage: nil, title: ""),
           TabItemData(image: "person.crop.circle", selectedImage: "person.crop.circle.fill", title: "Profile"),
           TabItemData(image: "list.dash", selectedImage: "list.dash.header.rectangle", title: "Menu")
       ], height: 100, width: UIScreen.main.bounds.width - 5, selectedIndex: $selectedIndexX)
}
