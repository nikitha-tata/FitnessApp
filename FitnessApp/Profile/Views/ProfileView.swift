//
//  ProfileView.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 23/08/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        VStack {
            
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            HStack(spacing: 16) {
                Image(systemName: viewModel.profileImageName ?? "smiley.fill")
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
                        .font(.title)
                        .fontWeight(.light)
                    
                    Text(viewModel.profileName?.uppercased() ?? "NIKITHA")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if viewModel.isEditingname {
                VStack {
                    TextField("Name", text: $viewModel.currentName)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .foregroundColor(.primary)
                        )
                    
                    HStack {
                        
                        ProfileCustomEditButtonView(title: "Cancel", backgroundColor: .gray.opacity(0.3), forgroundColor: .red) {
                            withAnimation {
                                viewModel.dismissEdit()
                            }
                        }
                        
                        ProfileCustomEditButtonView(title: "Done", backgroundColor: .primary, forgroundColor: .white) {
                            withAnimation {
                                viewModel.setNewName()
                            }
                            
                        }
                    } .padding()
                    
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray.opacity(0.1)))
                
                
                
            }
            
            if viewModel.isEditingImage {
                VStack(spacing: 0) {
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(viewModel.imagesArray, id: \.self) { image in
                                
                                Button(action: {
                                    
                                    withAnimation {
                                        viewModel.didSelectNewImage(name: image)
                                    }
                                    
                                    
                                }, label: {
                                    VStack {
                                        Image(systemName: image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .foregroundColor(.yellow)
                                            .padding()
                                        
                                        if image == viewModel.selectedImageName {
                                            Circle()
                                                .frame(width: 10)
                                                .foregroundColor(.primary)
                                        }
                                        
                                    }
                                    
                                })
                            }
                        }
                        
                        
                    }
                    
                    
                    HStack {
                        
                        ProfileCustomEditButtonView(title: "Cancel", backgroundColor: .gray.opacity(0.3), forgroundColor: .red) {
                            withAnimation {
                                viewModel.dismissEdit()
                            }
                        }
                        
                        ProfileCustomEditButtonView(title: "Done", backgroundColor: .primary, forgroundColor: .white) {
                            withAnimation {
                                viewModel.setNewImage()
                            }
                        }
                        
                    } .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray.opacity(0.1)))
            }
            
            VStack(spacing: 0) {
                ProfileCustomButtonView(title: "Edit Name", imageName: "square.and.pencil") {
                    withAnimation {
                        viewModel.presentEditName()
                    }
                }
                
                ProfileCustomButtonView(title: "Edit Image", imageName: "square.and.pencil") {
                    withAnimation {
                        viewModel.presentEditImage()
                    }
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
