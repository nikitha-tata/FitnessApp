//
//  ChartsView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 12/08/24.
//

import SwiftUI
import Charts

struct DailyStepModel: Identifiable {
    let id = UUID()
    let date: Date
    let count: Int
}

enum ChartOptions: String, CaseIterable {
    case oneWeek = "1W"
    case oneMonth = "1M"
    case threeMonth = "3M"
    case yearToDate = "YTD"
    case oneYear = "1Y"
}

class ChartsViewModel: ObservableObject {
    var mockChartData: [DailyStepModel] = [
        DailyStepModel(date: Date(), count: 12456),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 9678),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 9792),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 7892),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 10907),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 6890),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 9678)
    ]
    
    @Published var mockDataForOneMonth: [DailyStepModel] = []
    @Published var mockDataForThreeMonth: [DailyStepModel] = []
    
    
    init() {
        var mockData: [DailyStepModel] = generateDataForDays(days: 30)
        var mockThreeData: [DailyStepModel] = generateDataForDays(days: 90)
        DispatchQueue.main.async {
            self.mockDataForOneMonth = mockData
            self.mockDataForThreeMonth = mockThreeData
        }
        
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

struct ChartsView: View {
    @StateObject var viewModel = ChartsViewModel()
    @State var selectedChart: ChartOptions = .oneWeek
    var body: some View {
        VStack {
            Text("Charts")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ZStack {
                switch(selectedChart) {
                case .oneWeek:
                    Chart {
                        ForEach(viewModel.mockChartData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps Count", data.count))
                            
                        }
                        
                    }
                    
                case .oneMonth:
                    Chart {
                        ForEach(viewModel.mockDataForOneMonth) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps Count", data.count))
                            
                        }
                        
                    }
                    
                case .threeMonth:
                    Chart {
                        ForEach(viewModel.mockDataForThreeMonth) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps Count", data.count))
                            
                        }
                        
                    }
                    
                case .yearToDate:
                    EmptyView()
                case.oneYear:
                    EmptyView()
                    
                }
            }
            .frame(maxHeight: 350)
            .padding(.horizontal)
            .foregroundColor(.teal)
            
            HStack {
                ForEach(ChartOptions.allCases, id: \.rawValue) { option in
                    Button(option.rawValue) {
                        withAnimation {
                            selectedChart = option
                        }
                       
                    }
                    .padding()
                    .foregroundColor(option == selectedChart ? .white : .teal)
                    .background(option == selectedChart ? .teal : .clear)
                    .cornerRadius(8)
                }
            }
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

    
#Preview {
    ChartsView()
}
