//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 30/07/24.
//

import Foundation


// We should confirm to observableobject as it should observe the changes from view
class HomeViewModel: ObservableObject {
    
    @Published var calories: Int = 100
    @Published var exercise: Int = 30
    @Published var stand: Int = 50
    
    
    let healthManager = HealthManager.shared
    
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
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                self.fetchTodayCalories()
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func fetchTodayCalories() {
        healthManager.fetchTodayCaloriesBurned { result in
            self.fetchTodayExerciseTime()
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.calories = Int(response)
                }
            case .failure(let error):
                print(error.statusMessage)
            }
        }
    }
    
    func fetchTodayExerciseTime() {
        healthManager.fetchTodayExerciseTime { result in
            self.fetchTodayStandHours()
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.exercise = Int(response)
                }
            case .failure(let error):
                print(error.statusMessage)
            }
            
        }
    }
    
    func fetchTodayStandHours() {
        healthManager.fetchTodayStandHours { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.stand = Int(response)
                }
            case .failure(let error):
                print(error.statusMessage)
            }
        }
    }
}
