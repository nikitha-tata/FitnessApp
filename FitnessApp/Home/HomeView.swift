//
//  HomeView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 22/07/24.
//

import SwiftUI

struct HomeView: View {
    @State var calories: Int = 100
    @State var goal: Int = 30
    @State var stand: Int = 50
    
    let mockActivities: [Activity] = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "6,200"),
        Activity(id: 1, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "812"),
        Activity(id: 2, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "9,900"),
        Activity(id: 3, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .purple, amount: "55,000"),
        ]
    
    let mockWorkouts: [WorkOut] = [WorkOut(id: 0, title: "Running", image: "figure.run", duration: "30 mins", date: "29 July", calories: "500 kcal", tintColor: .green),
                                   WorkOut(id: 1, title: "Swimming", image: "figure.run", duration: "30 mins", date: "29 July", calories: "500 kcal", tintColor: .red),
                                   WorkOut(id: 2, title: "Strength Training", image: "figure.run", duration: "30 mins", date: "29 July", calories: "500 kcal", tintColor: .blue),
                                   WorkOut(id: 3, title: "Walking", image: "figure.run", duration: "30 mins", date: "29 July", calories: "500 kcal", tintColor: .purple),
                                   WorkOut(id: 4, title: "Exercise", image: "figure.run", duration: "30 mins", date: "29 July", calories: "500 kcal", tintColor: .pink),
                                   WorkOut(id: 5, title: "Yoga", image: "figure.run", duration: "30 mins", date: "29 July", calories: "500 kcal", tintColor: .yellow)]
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(EdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 8))
                }
                HStack {
                    
                   // Spacer()
                    VStack {
                        VStack {
                            Text("Calories")
                                .font(.title2)
                                .foregroundStyle(.teal)
                            Text("123 kcal")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        VStack {
                            Text("Active")
                                .font(.title2)
                                .foregroundStyle(.pink)
                            Text("15 min")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                       // .padding()
                        VStack {
                            Text("Stand")
                                .font(.title2)
                                .foregroundStyle(.orange)
                            Text("10 min")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        
                    }
                    
                    ZStack {
                        
                    ProgressCircleView(progress: $calories, goal: 600, color: .teal)
                    ProgressCircleView(progress: $goal, goal: 60, color: .pink)
                            .padding(.all, 20)
                    ProgressCircleView(progress: $stand, goal: 80, color: .orange)
                            .padding(.all, 40)
                            
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("Fitness Activity")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    Button(action: {
                        print("Show More")
                    }, label: {
                        Text("Show More")
                            .padding(.all, 10)
                            .foregroundStyle(.white)
                            .background(.blue)
                            .cornerRadius(8.0)
                        
                    })
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 8), count: 2)) {
                    ForEach(mockActivities, id: \.id) { activity in
                        ActivityCardView(activity: activity)
                    }
                }
                .padding(.horizontal)
                
                
                
                HStack {
                    Text("Recent WorkOuts")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Text("Show More")
                            .padding(.all, 10)
                            .foregroundStyle(.white)
                            .background(.blue)
                            .cornerRadius(8.0)
                    }

                }
                .padding()
                
                LazyVStack {
                    ForEach(mockWorkouts, id: \.id) { workout in
                        WorkoutCardView(workout: workout)
                    }
                }
                .padding(.horizontal)
                
            }
        }
    }
}


#Preview {
    HomeView()
}
