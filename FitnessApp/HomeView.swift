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
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
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
                .padding()
            }
        }
    }
}


#Preview {
    HomeView()
}
