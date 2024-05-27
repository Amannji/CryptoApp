//
//  SearchBarVIew.swift
//  CryptoApp
//
//  Created by Aman Gupta on 15/01/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? Color.secondaryText : Color.theme.accent)
                .offset(x:15)
            
            TextField("Type what you want to search",text:$searchText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle")
                        .padding()
                        .offset(x:10)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        
                        .onTapGesture{
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    , alignment: .trailing
                )
                .padding()
                
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.4), radius: 10, x:0, y:0)
                .padding()
        )
        
       
        
        
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
        .previewLayout(.sizeThatFits)
}
