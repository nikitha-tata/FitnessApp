//
//  LeaderBoardView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 20/08/24.
//

import SwiftUI

struct LeaderBoardUser: Codable {
    let id: Int
    let createdAt: String
    let username: String
    let stepCount: Int
}
class LeaderBoardViewModel: ObservableObject {
    let mockData: [LeaderBoardUser] = [
        LeaderBoardUser(id: 1, createdAt: "", username: "Nikitha", stepCount: 56783),
        LeaderBoardUser(id: 2, createdAt: "", username: "Shanmukh", stepCount: 78903),
        LeaderBoardUser(id: 3, createdAt: "", username: "Jason", stepCount: 45674),
        LeaderBoardUser(id: 4, createdAt: "", username: "Josie", stepCount: 5678),
        LeaderBoardUser(id: 5, createdAt: "", username: "Rishi", stepCount: 56783),
        LeaderBoardUser(id: 6, createdAt: "", username: "Renuka", stepCount: 45673),
        LeaderBoardUser(id: 7, createdAt: "", username: "Manu", stepCount: 34568),
        LeaderBoardUser(id: 8, createdAt: "", username: "Anusha", stepCount: 78213),
        LeaderBoardUser(id: 9, createdAt: "", username: "Kingery", stepCount: 56734),
        LeaderBoardUser(id: 10, createdAt: "", username: "Nilesh", stepCount: 96754),
    ]
}

struct LeaderBoardView: View {
    @StateObject var viewModel = LeaderBoardViewModel()
    @AppStorage("username") var username: String?
    
    @Binding var showTerms: Bool
    
    var body: some View {
        VStack {
            Text("LeaderBoard")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            HStack {
                Text("Name")
                    .fontWeight(.semibold)
                Spacer()
                Text("Steps")
                    .fontWeight(.semibold)
            }
            .padding()
            
            LazyVStack(spacing: 24) {
                ForEach(viewModel.mockData, id: \.id) { person in
                    HStack() {
                        Text("\(person.id). \(person.username)")
                            .fontWeight(.medium)
                        Spacer()
                        Text(person.stepCount.formatted())
                    
                    }
                    .padding(.horizontal)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .fullScreenCover(isPresented: $showTerms, content: {
            TermsView()
        })
    }
}

#Preview {
    LeaderBoardView( showTerms: .constant(true))
}
