//
//  StatisticalView.swift
//  CryptoApp
//
//  Created by Aman Gupta on 16/01/24.
//

import SwiftUI

struct StatisticalView: View {
    var stat: StatisticalModel
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack{
                Image(systemName:"triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0: 180))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.green : Color.red)
            .opacity(stat.percentageChange == nil  ? 0.0 : 1.0)
        }
    }
}



struct StatisticalView_Previews: PreviewProvider{
   static var previews: some View{
        StatisticalView(stat: dev.stats1)
           .previewLayout(.sizeThatFits)
       StatisticalView(stat: dev.stats2)
          .previewLayout(.sizeThatFits)
       StatisticalView(stat: dev.stats3)
          .previewLayout(.sizeThatFits)
          .preferredColorScheme(.dark)
    }
}
