//
//  ProfileCustomEditButtonView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 16/09/24.
//

import SwiftUI

struct ProfileCustomEditButtonView: View {
    @State var title: String
    @State var backgroundColor: Color
    @State var forgroundColor: Color
    var action: (() -> Void)
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .frame(width: 150, height: 44)
                .foregroundStyle(forgroundColor)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(backgroundColor))
            
        })
    }
}

#Preview {
    ProfileCustomEditButtonView(title: "", backgroundColor: .primary, forgroundColor: .red, action: {})
}
