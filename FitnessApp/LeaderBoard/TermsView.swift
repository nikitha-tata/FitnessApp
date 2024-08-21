//
//  TermsView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 21/08/24.
//

import SwiftUI

struct TermsView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("username") var username: String?
    @State var name: String = ""
    @State var acceptedTerms: Bool = false
    
    var body: some View {
       
        VStack {
            Text("LeaderBoard")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Spacer()
            TextField("Username", text: $name)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                )
            
            HStack(alignment: .top) {
                Button(action: {
                    withAnimation {
                        acceptedTerms.toggle()
                    }
                    
                }, label: {
                    if acceptedTerms {
                        Image(systemName: "square.inset.filled")
                        
                    } else {
                        Image(systemName: "square")

                    }
                })
                
                
                Text("By Checking you agree to the terms and conditions to enter into the Leaderboard Competition")
            }
            Spacer()
            Button(action: {
                if acceptedTerms == true && name.count > 2 {
                    username = name
                    dismiss()
                }
            }, label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10))
                    
                
            })
        }
        .padding(.horizontal)
    }
}

#Preview {
    TermsView()
}
