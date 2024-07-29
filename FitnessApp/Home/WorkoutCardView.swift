//
//  WorkoutCardView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 29/07/24.
//

import SwiftUI

struct WorkOut {
    let id: Int
    let title: String
    let image: String
    let duration: String
    let date: String
    let calories: String
    let tintColor: Color
}

struct WorkoutCardView: View {
    @State var workout: WorkOut
    var body: some View {
        HStack {
            Image(systemName: workout.image)
                .frame(width: 60, height: 60)
                .scaledToFill()
                .background(.gray.opacity(0.1))
                .foregroundColor(workout.tintColor)
                .cornerRadius(8.0)
               // .padding()
            
       
            VStack(spacing: 16) {
                HStack {
                    Text(workout.title)
                        .font(.title3)
                        .fontWeight(.bold)
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
