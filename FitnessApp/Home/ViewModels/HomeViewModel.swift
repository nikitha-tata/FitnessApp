//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 30/07/24.
//

import Foundation
import SwiftUI

// We should confirm to observableobject as it should observe the changes from view
class HomeViewModel: ObservableObject {
    
    @State var calories: Int = 100
    @State var goal: Int = 30
    @State var stand: Int = 50
    @State var active: Int = 54
    
    //Will add @Published if this variable changes continuosly
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
}
