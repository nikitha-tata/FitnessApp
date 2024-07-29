//
//  ProgressCircle.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 22/07/24.
//

import SwiftUI

struct ProgressCircleView: View {
    @Binding var progress: Int
    var goal : Int
    var color : Color
    var width : CGFloat = 20
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.5), lineWidth: width)
            Circle()
                .trim(from: 0 , to: CGFloat(progress)/CGFloat(goal))
                .stroke(color, style: StrokeStyle(lineWidth: width, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
    }
}

#Preview {
    ProgressCircleView(progress: .constant(10), goal: 50, color: .purple)
}
