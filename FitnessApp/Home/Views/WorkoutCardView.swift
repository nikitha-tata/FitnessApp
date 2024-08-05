//
//  WorkoutCardView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 29/07/24.
//

import SwiftUI

struct WorkoutCardView: View {
    
    @State var workout: WorkOut
    var body: some View {
        HStack {
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .padding()
                .background(.gray.opacity(0.1))
                .foregroundColor(workout.tintColor)
                .cornerRadius(8.0)
               // .padding()
            
       
            VStack(spacing: 16) {
                HStack {
                    Text(workout.title)
                        .font(.title3)
                        .fontWeight(.medium)
                    Spacer()
                    Text(workout.duration)
                       
                }
                
                HStack {
                    Text(workout.date)
                    Spacer()
                    Text(workout.calories)
                }
               
            }
            
        }
    }
}

#Preview {
    WorkoutCardView(workout: WorkOut(id: 0, title: "Running", image: "figure.run", duration: "30 mins", date: "29 July", calories: "500 kcal", tintColor: .green))
}
