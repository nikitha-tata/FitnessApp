//
//  HealthManager.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 30/07/24.
//

import Foundation
import HealthKit


struct HKError: Error {
    var statusMessage: String?
}

class HealthManager {
    static let shared  = HealthManager()
    let healthscore = HKHealthStore()
    
    private init() {}
    
    func requestHealthKitAccess() async throws{
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        let steps = HKQuantityType(.stepCount)
        let workouts = HKSampleType.workoutType()
        
        let healthTypes: Set = [calories, exercise, stand, steps, workouts]
        try await healthscore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    func fetchTodayCaloriesBurned(completion: @escaping(Result<Double, HKError>) -> Void) {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(HKError(statusMessage: "Calorie Data is not available")))
                return
            }
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(calorieCount))
        }
        healthscore.execute(query)
    }
    
    func fetchTodayExerciseTime(completion: @escaping(Result<Double, HKError>) -> Void) {
        let exercise = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(HKError(statusMessage: "Exercise Data is not Available")))
                return
            }
            let exerciseTime = quantity.doubleValue(for: .minute())
            completion(.success(exerciseTime))
        }
        healthscore.execute(query)
    }
    
    func fetchTodayStandHours(completion: @escaping(Result<Double, HKError>) -> Void) {
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, results, error in
            guard let samples = results as? [HKCategorySample], error == nil else {
                completion(.failure(HKError(statusMessage: "Stand Data is not available")))
                return
            }
            print(samples)
            print(samples.map{$0.value})
        }
        healthscore.execute(query)
    }
    
    //MARK: Fitness Activity
    
    func fetchTodaySteps(completion: @escaping(Result<Activity, HKError>) -> Void) {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(HKError(statusMessage: "Exercise Data is not Available")))
                return
            }
            let steps = quantity.doubleValue(for: .count())
            let Activity = Activity(title: "Today's Steps", subtitle: "Goal: 800", image: "figure.walk", tintColor: .green, amount: steps.formatterNumberString())
            completion(.success(Activity))
        }
        healthscore.execute(query)
    }
    
    func fetchCurrentWeekWorkouts(completion: @escaping(Result<[Activity], HKError>) -> Void) {
        let workouts = HKSampleType.workoutType()
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let query = HKSampleQuery(sampleType: workouts, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { [weak self] _, results, error in
            guard let workouts = results as? [HKWorkout], error == nil else {
                completion(.failure(HKError(statusMessage: "Workouts Data is not Available")))
                return
            }
            
            var runningCount: Int = 0
            var strengthCount: Int = 0
            var soccerCount: Int = 0
            var basketballCount: Int = 0
            var stairsCount: Int = 0
            var kickBoxingCount: Int = 0
            
            for workout in workouts {
                let duration = Int(workout.duration)/60
                if workout.workoutActivityType == .running {
                    runningCount += duration
                } else if workout.workoutActivityType == .traditionalStrengthTraining {
                    strengthCount += duration
                } else if workout.workoutActivityType == .soccer {
                    soccerCount += duration
                } else if workout.workoutActivityType == .basketball {
                    basketballCount += duration
                } else if workout.workoutActivityType == .stairClimbing {
                    stairsCount += duration
                } else if workout.workoutActivityType == .kickboxing {
                    kickBoxingCount += duration
                }
            }
            
            completion(.success(self?.generateActivitiesFromDuration(running: runningCount, strength: strengthCount, soccer: soccerCount, basketball: basketballCount, stairs: stairsCount, kickbox: kickBoxingCount) ?? []))
        }
        healthscore.execute(query)
    }
    
    func generateActivitiesFromDuration(running: Int, strength: Int, soccer: Int, basketball: Int, stairs: Int, kickbox: Int) -> [Activity] {
        return [
            Activity(title: "Running", subtitle: "This Week", image: "figure.run", tintColor: .green, amount: "\(running) mins"),
            Activity(title: "Strength Training", subtitle: "This Week", image: "dumbbell", tintColor: .blue, amount: "\(strength) mins"),
            Activity(title: "Soccer", subtitle: "This Week", image: "figure.soccer", tintColor: .indigo, amount: "\(soccer) mins"),
            Activity(title: "Basket Ball", subtitle: "This Week", image: "figure.basketball", tintColor: .pink, amount: "\(basketball) mins"),
            Activity(title: "Stairstepper", subtitle: "This Week", image: "figure.stairs", tintColor: .yellow, amount: "\(stairs) mins"),
            Activity(title: "KickBoxing", subtitle: "This Week", image: "figure.kickboxing", tintColor: .purple, amount: "\(kickbox) mins")
        ]
    }
    
    
    //MARK: Recent Workouts
    
    func fetchWorkoutsForMonth(month: Date, completion: @escaping(Result<[WorkOut], HKError>) -> Void) {
        let workouts = HKSampleType.workoutType()
        let (startDate, endDate) = month.fetchMonthStartandEndDate()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: workouts, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { _, results, error in
            guard let workouts = results as? [HKWorkout], error == nil else {
                completion(.failure(HKError(statusMessage: "Workouts Data is not Available")))
                return
            }
            
            let workoutArray = workouts.map{ WorkOut(id: nil, title: $0.workoutActivityType.name, image: $0.workoutActivityType.symbol, duration: "\(Int($0.duration)/60) mins" , date: $0.startDate.formatDateToString(), calories: $0.totalEnergyBurned?.doubleValue(for: .kilocalorie()).formatterNumberString() ?? "-", tintColor: $0.workoutActivityType.color)}
            completion(.success(workoutArray))
        }
        healthscore.execute(query)
    }
}


//MARK: ChartView Data

extension HealthManager {
    
    struct YearChartDataResult {
        let ytd: [MonthlyStepModel]
        let oneYear: [MonthlyStepModel]
    }
    
    func fetchYTDAndOneYearData(completion: @escaping(Result<YearChartDataResult, HKError>) -> Void) {
        let steps = HKQuantityType(.stepCount)
        let calendar = Calendar.current
        
        var oneYearMonths = [MonthlyStepModel]()
        var ytdMonths = [MonthlyStepModel]()
        
        for i in 0...11 {
            let month = calendar.date(byAdding: .month, value: -i, to: Date()) ?? Date()
            let (startOfMonth, endOfMonth) = month.fetchMonthStartandEndDate()
            let predicate = HKQuery.predicateForSamples(withStart: startOfMonth, end: endOfMonth)
            let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, results, error in
                guard let steps = results?.sumQuantity()?.doubleValue(for: .count()), error == nil else {
                    completion(.failure(HKError(statusMessage: "Steps Data is not Available")))
                    return
                }
                
                if i == 0 {
                    oneYearMonths.append(MonthlyStepModel(date: month, count: Int(steps)))
                    ytdMonths.append(MonthlyStepModel(date: month, count: Int(steps)))
                } else {
                    oneYearMonths.append(MonthlyStepModel(date: month, count: Int(steps)))
                    if calendar.component(.year, from: Date()) == calendar.component(.year, from: month) {
                        ytdMonths.append(MonthlyStepModel(date: month, count: Int(steps)))
                    }
                }
                if i == 11 {
                    
                    completion(.success(YearChartDataResult(ytd: ytdMonths, oneYear: oneYearMonths)))
                }
            }
            healthscore.execute(query)
            
        }
    }
}
