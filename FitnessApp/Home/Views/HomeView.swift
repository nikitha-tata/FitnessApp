//
//  HomeView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 22/07/24.
//

import SwiftUI



struct HomeView: View {
    // created as stateobject as we should know it is instance of some class
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
               // VStack(alignment: .leading) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(EdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 8))
               // }
                HStack {
                    
                    // Spacer()
                    VStack {
                        
                        VStack(alignment: .leading) {
                            Text("Calories")
                                .font(.title2)
                                .foregroundStyle(.teal)
                            Text("\(viewModel.calories) kcal")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Active")
                                .font(.title2)
                                .foregroundStyle(.pink)
                            Text("\(viewModel.active) mins")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        // .padding()
                        VStack(alignment: .leading) {
                            Text("Stand")
                                .font(.title2)
                                .foregroundStyle(.orange)
                            Text("\(viewModel.stand) hours")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        
                    }
                    
                    ZStack {
                        
                        ProgressCircleView(progress: $viewModel.calories, goal: 600, color: .teal)
                        ProgressCircleView(progress: $viewModel.goal, goal: 60, color: .pink)
                            .padding(.all, 20)
                        ProgressCircleView(progress: $viewModel.stand, goal: 80, color: .orange)
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
                    ForEach(viewModel.mockActivities, id: \.id) { activity in
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
                    ForEach(viewModel.mockWorkouts, id: \.id) { workout in
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
