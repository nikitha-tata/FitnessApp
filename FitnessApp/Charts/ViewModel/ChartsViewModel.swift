//
//  ChartsDataModel.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 12/08/24.
//

import Foundation

class ChartsViewModel: ObservableObject {
    let healthManager = HealthManager.shared
    var mockWeekChartData: [DailyStepModel] = [
        DailyStepModel(date: Date(), count: 12456),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 9678),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 9792),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 7892),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 10907),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 6890),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 9678)
    ]
    @Published var averageWeekSteps: Int = 7000
    @Published var totalWeekSteps: Int = 90000
    
    
    var mockYTDChartData: [MonthlyStepModel] = [
        MonthlyStepModel(date: Date(), count: 70987),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(), count: 60023),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -2, to: Date()) ?? Date(), count: 70923),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(), count: 80457),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -4, to: Date()) ?? Date(), count: 90876),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -5, to: Date()) ?? Date(), count: 70345),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -6, to: Date()) ?? Date(), count: 80912)
    ]
    
    @Published var ytdChartData: [MonthlyStepModel] = []
    @Published var averageYTDSteps: Int = 689068
    @Published var totalYTDSteps: Int = 689789739
    
    @Published var mockDataForOneMonth: [DailyStepModel] = []
    @Published var averageMonthSteps: Int = 30900
    @Published var totalMonthSteps: Int = 308900
    
    @Published var mockDataForThreeMonth: [DailyStepModel] = []
    @Published var averageThreeMonthSteps: Int = 608744
    @Published var totalThreeMonthSteps: Int = 38878979
    
    @Published var oneYearChartData: [MonthlyStepModel] = []
    @Published var averageYearSteps: Int = 689068
    @Published var totalYearSteps: Int = 689789739
    
    init() {
        
        let mockData: [DailyStepModel] = generateDataForDays(days: 30)
        let mockThreeData: [DailyStepModel] = generateDataForDays(days: 90)
        DispatchQueue.main.async {
            self.mockDataForOneMonth = mockData
            self.mockDataForThreeMonth = mockThreeData
        }
        self.fetchYTDAndOneYearChartData()
    }
    
    private func generateDataForDays(days: Int) -> [DailyStepModel] {
        var data: [DailyStepModel] = []
        for i in 0..<days {
            let date = Calendar.current.date(byAdding: .day, value: -i, to: Date()) ?? Date()
            let count = Int.random(in: 6000...13000)
            data.append(DailyStepModel(date: date, count: count))
        }
        return data
    }
}

//MARK: Fetch Charts Data from HealthKit

extension ChartsViewModel {
    
    func fetchYTDAndOneYearChartData() {
        healthManager.fetchYTDAndOneYearData { result in
            switch(result) {
                
            case .success(let result):
                DispatchQueue.main.async {
                    self.ytdChartData = result.ytd
                    self.oneYearChartData = result.oneYear
                    
                    self.totalYTDSteps = result.ytd.reduce(0, {$0 + $1.count})
                    self.totalYearSteps = result.oneYear.reduce(0, {$0 + $1.count})
                    
                    self.averageYTDSteps = self.totalYTDSteps / Calendar.current.component(.month, from: Date())
                    self.averageYearSteps = self.totalYearSteps / 12
                    
                }
            case .failure(_):
                break
            }
        }
    }
}
