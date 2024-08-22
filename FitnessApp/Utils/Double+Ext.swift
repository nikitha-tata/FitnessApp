//
//  Double+Ext.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 22/08/24.
//

import Foundation

extension Double {
    func formatterNumberString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
