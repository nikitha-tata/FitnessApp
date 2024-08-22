//
//  LeaderBoardView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 20/08/24.
//

import SwiftUI


struct LeaderBoardView: View {
    @StateObject var viewModel = LeaderBoardViewModel()
    @AppStorage("username") var username: String?
    
    @Binding var showTerms: Bool
    
    var body: some View {
        ZStack {
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
           
            if showTerms {
                Color(.white)
                TermsView(showTerms: $showTerms)
            }
        }
    }
}

#Preview {
    LeaderBoardView( showTerms: .constant(true))
}
