//
//  ProfileView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 23/08/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack {
            
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            HStack(spacing: 16) {
                Image(systemName: "face.smiling.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.yellow)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray.opacity(0.25))
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Good Morning!!!")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Text("Nikitha")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 0) {
                ProfileCustomButtonView(title: "Edit Name", imageName: "square.and.pencil") {
                    print("Edit Name")
                }
                
                ProfileCustomButtonView(title: "Edit Image", imageName: "square.and.pencil") {
                    print("Edit Image")
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray.opacity(0.15))
            )
            
            VStack(spacing: 0) {
                ProfileCustomButtonView(title: "Contact Us", imageName: "envelope") {
                    print("Contact")
                }
                
                ProfileCustomButtonView(title: "Privacy Policy", imageName: "doc") {
                    print("Privacy")
                }
                
                ProfileCustomButtonView(title: "Terms of Service", imageName: "doc") {
                    print("Terms")
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray.opacity(0.15))
            )
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ProfileView()
}
