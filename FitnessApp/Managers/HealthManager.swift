//
//  HealthManager.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 30/07/24.
//

import Foundation
import HealthKit

extension Date {
    static var startOfDay: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
}

struct HKError: Error {
    var statusMessage: String?
}

class HealthManager {
    static let shared  = HealthManager()
    let healthscore = HKHealthStore()
    
    private init() {
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        
        let healthTypes: Set = [calories, exercise, stand]
        
        Task {
            do {
                try await healthscore.requestAuthorization(toShare: [], read: healthTypes)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func requestHealthKitAccess() async throws{
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        
        let healthTypes: Set = [calories, exercise, stand]
        try await healthscore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    func fetchTodayCaloriesBurned(completion: @escaping(Result<Double, HKError>) -> Void) {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(HKError(statusMessage: "Response Failure")))
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
                completion(.failure(HKError(statusMessage: "Response Failure")))
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
                completion(.failure(HKError(statusMessage: "Response Failure")))
                return
            }
            print(samples)
            print(samples.map{$0.value})
        }
        healthscore.execute(query)
    }
}
