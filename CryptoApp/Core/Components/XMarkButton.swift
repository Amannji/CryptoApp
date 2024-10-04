//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Aman Gupta on 29/09/24.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action:{
            presentationMode.wrappedValue.dismiss()
        }){
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}

#Preview {
    XMarkButton()
}
