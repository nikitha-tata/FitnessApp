//
//  LeaderBoardUser.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 22/08/24.
//

import Foundation

struct LeaderBoardUser: Codable {
    let id: Int
    let createdAt: String
    let username: String
    let stepCount: Int
}

