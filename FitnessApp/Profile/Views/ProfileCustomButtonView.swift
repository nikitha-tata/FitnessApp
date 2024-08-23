//
//  ProfileCustomButtonView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 23/08/24.
//

import SwiftUI

struct ProfileCustomButtonView: View {
    @State var title: String
    @State var imageName: String
    var action: (() -> Void)
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                Text(title)
                    .font(.title3)
                    .fontWeight(.regular)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.primary)
            
        })
    }
}

#Preview {
    ProfileCustomButtonView(title: "Edit Name", imageName: "square.and.pencil", action: {})
}
