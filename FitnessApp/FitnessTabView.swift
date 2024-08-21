//
//  FitnessTabView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 22/07/24.
//

import SwiftUI

struct FitnessTabView: View {
    @AppStorage("username") var username: String?
    @State var selectedTab = "Home"
    @State var showTerms: Bool = true
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.selected.iconColor = .systemTeal
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemTeal]
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab,content:  {
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ChartsView()
                .tag("Charts")
                .tabItem {
                    Image(systemName: "chart.xyaxis.line")
                    Text("Charts")
                }
            LeaderBoardView(showTerms: $showTerms)
                .tag("LeaderBoard")
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("LeaderBoard")
                }
        })
        .onAppear {
            showTerms = username == nil
        }
        
    }
}

#Preview {
    FitnessTabView()
}
