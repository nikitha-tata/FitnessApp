//
//  ChartDataView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 12/08/24.
//

import SwiftUI

struct ChartDataView: View {
    @State var average: Int
    @State var total: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Text("Average")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)
                    .padding(.vertical)
                Text("\(average)")
                    .font(.callout)
                    .foregroundStyle(.primary)
                    .padding(.bottom)
            }
            
            .frame(maxWidth: 120)
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
            
            Spacer()
            
            VStack {
                Text("Total")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)
                    .padding(.vertical)
                Text("\(total)")
                    .font(.callout)
                    .foregroundStyle(.primary)
                    .padding(.bottom)
            }
            
            .frame(maxWidth: 120
            )
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
            Spacer()
        }
    }
}

#Preview {
    ChartDataView(average: 1234, total: 89273)
}
