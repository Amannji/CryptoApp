//
//  HomeView.swift
//  CryptoApp
//
//  Created by Aman Gupta on 02/01/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            //backgroundColor
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack{
                HStack{
                    CircleButtonView(iconName:"info")
                    Spacer()
                    Text("Live Prices")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.theme.accent)
                    
                    Spacer()
                    CircleButtonView(iconName:"chevron.right")
                }
                .padding(.horizontal)
                Spacer(minLength: 0)
            }
            
            
        }
    }
}

#Preview {
    NavigationView{
        HomeView()
            .navigationBarHidden(true)
    }
}
