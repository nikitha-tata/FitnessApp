//
//  ChartsView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 12/08/24.
//

import SwiftUI
import Charts

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
                    VStack {
                        ChartDataView(average: viewModel.averageWeekSteps, total: viewModel.totalWeekSteps)
                        Chart {
                            ForEach(viewModel.mockWeekChartData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps Count", data.count))
                                
                            }
                            
                        }
                    }
                case .oneMonth:
                    VStack {
                        ChartDataView(average: viewModel.averageMonthSteps, total: viewModel.totalMonthSteps)
                        Chart {
                            ForEach(viewModel.mockDataForOneMonth) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps Count", data.count))
                                
                            }
                            
                        }
                    }
                    
                case .threeMonth:
                    VStack {
                        ChartDataView(average: viewModel.averageThreeMonthSteps, total: viewModel.totalThreeMonthSteps)
                        Chart {
                            ForEach(viewModel.mockDataForThreeMonth) { data in
                                LineMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps Count", data.count))
                                
                            }
                            
                        }
                    }
                    
                case .yearToDate:
                    VStack {
                        ChartDataView(average: viewModel.averageYTDSteps, total: viewModel.totalYTDSteps)
                        Chart {
                            ForEach(viewModel.ytdChartData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .month), y: .value("Steps Count", data.count))
                                
                            }
                            
                        }
                    }
                case.oneYear:
                    VStack {
                        ChartDataView(average: viewModel.averageYearSteps, total: viewModel.totalYearSteps)
                        Chart {
                            ForEach(viewModel.oneYearChartData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .month), y: .value("Steps Count", data.count))
                                
                            }
                            
                        }
                    }
                    
                }
            }
            .frame(maxHeight: 450)
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
