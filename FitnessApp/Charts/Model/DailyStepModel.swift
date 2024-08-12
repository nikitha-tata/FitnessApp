//
//  DailyStepModel.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 12/08/24.
//

import Foundation

struct DailyStepModel: Identifiable {
    let id = UUID()
    let date: Date
    let count: Int
}
