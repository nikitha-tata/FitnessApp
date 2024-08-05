//
//  ActivityCardView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 29/07/24.
//

import SwiftUI



struct ActivityCardView: View {
    @State var activity: Activity
    var body: some View {
        ZStack(alignment: .leading) {
            Color(uiColor: .systemGray6)
                .cornerRadius(16.0)
            VStack() {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(activity.title)
                        Text(activity.subtitle)
                            .font(.caption)
                    }
                    
                    Spacer()
                    Image(systemName: activity.image)
                        .foregroundColor(activity.tintColor)
                }
                
                Text(activity.amount)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
              
            
            }
            .padding()
        }
    }
}

#Preview {
    ActivityCardView(activity: Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "6,200"))
}
