//
//  ProfileViewModel.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 16/09/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published  var isEditingname: Bool = false
    @Published  var currentName: String = ""
    
    @Published  var isEditingImage: Bool = false
    @Published  var selectedImageName: String?
    
    @Published var profileName = UserDefaults.standard.string(forKey: "profileName")
    @Published var profileImageName = UserDefaults.standard.string(forKey: "ProfileimageName")
    
   var imagesArray: [String] = ["smiley.fill", "smiley", "star.circle.fill", "fan.fill", "person.circle.fill", "figure.wave.circle.fill", "soccerball.circle.fill.inverse", "basketball.fill", "volleyball.fill" ]
    
    func presentEditName() {
        self.currentName = profileName ?? ""
        self.isEditingImage = false
        self.isEditingname = true
    }
    
    func presentEditImage() {
        self.selectedImageName = profileImageName
        self.isEditingname = false
        self.isEditingImage = true
    }
    
    func dismissEdit() {
        self.isEditingname = false
        self.isEditingImage = false
    }
    
    func setNewName() {
        //UserDefaults.standard.setValue(currentName, forKey: "profileName")
        profileName = currentName
        self.dismissEdit()
    }
    
    func didSelectNewImage(name: String) {
        selectedImageName = name
    }
    
    func setNewImage() {
       // UserDefaults.standard.setValue(selectedImageName, forKey: "ProfileimageName")
        profileImageName = selectedImageName
        self.dismissEdit()
    }
}
