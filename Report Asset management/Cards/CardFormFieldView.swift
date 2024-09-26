//
//  CardFormFieldView.swift
//  Report Asset management
//
//  Created by sothea007 on 23/9/24.
//

import SwiftUI

struct CardFormFieldView: View {
    
    @Binding var text               : String
    @State private var isEditing    = false
    
    var onEdit                  : (() -> Void)?
    
    var fieldTitle              : String
    var isSecure                : Bool
    var autocapitalizationType  : UITextAutocapitalizationType
    var isCreditCardNumber      : Bool
    var isExpiryDate            : Bool
    
    init(text       : Binding<String>,
         isEditing  : Bool = false,
         onEdit     : (() -> Void)? = nil,
         fieldTitle : String,
         isSecure   : Bool = false,
         autocapitalizationType : UITextAutocapitalizationType = .none,
         isCreditCardNumber     : Bool = false,
         isExpiryDate           : Bool = false) {
        
        self._text                  = text
        self.isEditing              = isEditing
        self.onEdit                 = onEdit
        self.fieldTitle             = fieldTitle
        self.isSecure               = isSecure
        self.autocapitalizationType = autocapitalizationType
        self.isCreditCardNumber     = isCreditCardNumber
        self.isExpiryDate           = isExpiryDate
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fieldTitle)
                .font(.system(size: 16,weight: .bold,design: .rounded))
                .foregroundStyle(isEditing ? .red : .primaryColor)
            Group {
                if isSecure {
                    SecureField("",text: $text,onCommit: {onEdit?()})
                }else {
                    TextField("",
                              text: $text,onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                        if !isEditing { 
                            onEdit?()
                        }
                    })
                }
            }
            .font(.system(size: 20,weight: .bold,design: .monospaced))
            .foregroundColor(.textFieldTextColor)
            .autocapitalization(autocapitalizationType)
            .disableAutocorrection(true)
            .padding(.all,6)
            .background(Color.textFieldColor)
            .cornerRadius(5)
        }
    }
}

#Preview {
    @State var text : String = "3039 3933 3939"
    return CardFormFieldView(text: $text, fieldTitle: "text", isSecure: true, autocapitalizationType: .words, isCreditCardNumber: true, isExpiryDate: true)
}
