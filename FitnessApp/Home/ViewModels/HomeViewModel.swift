//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 30/07/24.
//

import Foundation


// We should confirm to observableobject as it should observe the changes from view
class HomeViewModel: ObservableObject {
    
    @Published var calories: Int = 0
    @Published var exercise: Int = 0
    @Published var stand: Int = 0
    @Published var activities = [Activity]()
    @Published var workouts = [WorkOut]()
    
    let healthManager = HealthManager.shared
    
    //Will add @Published if this variable changes continuosly
    let mockActivities: [Activity] = [
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "6,200"),
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "812"),
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "9,900"),
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .purple, amount: "55,000"),
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
                self.fetchTodayExerciseTime()
                self.fetchTodayStandHours()
                self.fetchTodaysSteps()
                self.fetchAllWorkouts()
                self.fetchRecentWorkouts()
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func fetchTodayCalories() {
        healthManager.fetchTodayCaloriesBurned { [weak self] result in
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.calories = Int(response)
                    let activity = Activity(title: "Calories Burned", subtitle: "Today", image: "flame", tintColor: .red, amount: response.formatterNumberString())
                    self?.activities.append(activity)
                }
            case .failure(let error):
                break
            }
        }
    }
    
    func fetchTodayExerciseTime() {
        healthManager.fetchTodayExerciseTime { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.exercise = Int(response)
                }
            case .failure(let error):
                break
            }
            
        }
    }
    
    func fetchTodayStandHours() {
        healthManager.fetchTodayStandHours { [weak self] result in
           
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.stand = Int(response)
                }
            case .failure(let error):
                break
            }
        }
    }
    
    //MARK: Fitness Activity
    
    func fetchTodaysSteps() {
        healthManager.fetchTodaySteps { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.activities.append(response)
                }
            case .failure(let error):
                break
            }
        }
    }
    
    
    func fetchAllWorkouts() {
        healthManager.fetchCurrentWeekWorkouts { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.activities.append(contentsOf: response)
                }
            case .failure(let error):
                break
            }
        }
    }
    
    //MARK: Workout Activity
    
    func fetchRecentWorkouts() {
        healthManager.fetchWorkoutsForMonth(month: Date()) { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.workouts = Array(response.prefix(4))
                }
            case .failure(let error):
                break
            }
        }
    }
   
}
