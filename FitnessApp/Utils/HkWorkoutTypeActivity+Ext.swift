//
//  HkWorkoutTypeActivity+Ext.swift
//  FitnessApp
//
//  Created by Nikitha Tata on 05/08/24.
//

import Foundation
import HealthKit
import SwiftUI

extension HKWorkoutActivityType {

    /*
     Simple mapping of available workout types to a human readable name.
     */
    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"

        // iOS 10
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:    return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"

        // iOS 11
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"

        // iOS 13
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"

        // Catch-all
        default:                            return "Other"
        }
    }

    /*
       Simple mapping of available workout types to a corresponding SFSymbol.
       */
      var symbol: String {
          switch self {
          case .americanFootball:             return "sportscourt"
          case .archery:                      return "target"
          case .australianFootball:           return "sportscourt"
          case .badminton:                    return "sportscourt"
          case .baseball:                     return "sportscourt"
          case .basketball:                   return "sportscourt"
          case .bowling:                      return "sportscourt"
          case .boxing:                       return "sportscourt"
          case .climbing:                     return "figure.walk"
          case .crossTraining:                return "figure.strengthtraining.traditional"
          case .curling:                      return "sportscourt"
          case .cycling:                      return "bicycle"
          case .dance:                        return "figure.dance"
          case .danceInspiredTraining:        return "figure.dance"
          case .elliptical:                   return "figure.strengthtraining.traditional"
          case .equestrianSports:             return "figure.walk"
          case .fencing:                      return "sportscourt"
          case .fishing:                      return "sportscourt"
          case .functionalStrengthTraining:   return "figure.strengthtraining.traditional"
          case .golf:                         return "sportscourt"
          case .gymnastics:                   return "figure.strengthtraining.traditional"
          case .handball:                     return "sportscourt"
          case .hiking:                       return "figure.hiking"
          case .hockey:                       return "sportscourt"
          case .hunting:                      return "sportscourt"
          case .lacrosse:                     return "sportscourt"
          case .martialArts:                  return "sportscourt"
          case .mindAndBody:                  return "figure.mind.and.body"
          case .mixedMetabolicCardioTraining: return "figure.strengthtraining.traditional"
          case .paddleSports:                 return "sportscourt"
          case .play:                         return "figure.play"
          case .preparationAndRecovery:       return "figure.strengthtraining.traditional"
          case .racquetball:                  return "sportscourt"
          case .rowing:                       return "sportscourt"
          case .rugby:                        return "sportscourt"
          case .running:                      return "figure.run"
          case .sailing:                      return "sportscourt"
          case .skatingSports:                return "figure.ice.skate"
          case .snowSports:                   return "sportscourt"
          case .soccer:                       return "sportscourt"
          case .softball:                     return "sportscourt"
          case .squash:                       return "sportscourt"
          case .stairClimbing:                return "figure.stairs"
          case .surfingSports:                return "sportscourt"
          case .swimming:                     return "figure.swim"
          case .tableTennis:                  return "sportscourt"
          case .tennis:                       return "sportscourt"
          case .trackAndField:                return "sportscourt"
          case .traditionalStrengthTraining:  return "figure.strengthtraining.traditional"
          case .volleyball:                   return "sportscourt"
          case .walking:                      return "figure.walk"
          case .waterFitness:                 return "figure.swim"
          case .waterPolo:                    return "sportscourt"
          case .waterSports:                  return "sportscourt"
          case .wrestling:                    return "sportscourt"
          case .yoga:                         return "figure.yoga"
          
          // iOS 10
          case .barre:                        return "figure.barre"
          case .coreTraining:                 return "figure.strengthtraining.traditional"
          case .crossCountrySkiing:           return "figure.skiing.crosscountry"
          case .downhillSkiing:               return "figure.skiing.downhill"
          case .flexibility:                  return "figure.mind.and.body"
          case .highIntensityIntervalTraining:return "figure.strengthtraining.traditional"
          case .jumpRope:                     return "figure.jumprope"
          case .kickboxing:                   return "sportscourt"
          case .pilates:                      return "figure.pilates"
          case .snowboarding:                 return "figure.snowboarding"
          case .stairs:                       return "figure.stairs"
          case .stepTraining:                 return "figure.steptraining"
          case .wheelchairWalkPace:           return "figure.walk"
          case .wheelchairRunPace:            return "figure.run"
          
          // iOS 11
          case .taiChi:                       return "figure.mind.and.body"
          case .mixedCardio:                  return "figure.strengthtraining.traditional"
          case .handCycling:                  return "sportscourt"
          
          // iOS 13
          case .discSports:                   return "sportscourt"
          case .fitnessGaming:                return "figure.play"
          
          // Catch-all
          default:                            return "questionmark"
          }
      }

    
    /*
        Simple mapping of available workout types to a corresponding SwiftUI Color.
        */
       var color: Color {
           switch self {
           case .americanFootball:             return .red
           case .archery:                      return .green
           case .australianFootball:           return .red
           case .badminton:                    return .blue
           case .baseball:                     return .orange
           case .basketball:                   return .brown
           case .bowling:                      return .purple
           case .boxing:                       return .red
           case .climbing:                     return .gray
           case .crossTraining:                return .blue
           case .curling:                      return .gray
           case .cycling:                      return .yellow
           case .dance:                        return .pink
           case .danceInspiredTraining:        return .pink
           case .elliptical:                   return .blue
           case .equestrianSports:             return .brown
           case .fencing:                      return .black
           case .fishing:                      return .blue
           case .functionalStrengthTraining:   return .blue
           case .golf:                         return .green
           case .gymnastics:                   return .purple
           case .handball:                     return .orange
           case .hiking:                       return .green
           case .hockey:                       return .gray
           case .hunting:                      return .brown
           case .lacrosse:                     return .orange
           case .martialArts:                  return .red
           case .mindAndBody:                  return .purple
           case .mixedMetabolicCardioTraining: return .blue
           case .paddleSports:                 return .blue
           case .play:                         return .green
           case .preparationAndRecovery:       return .blue
           case .racquetball:                  return .blue
           case .rowing:                       return .blue
           case .rugby:                        return .red
           case .running:                      return .yellow
           case .sailing:                      return .blue
           case .skatingSports:                return .gray
           case .snowSports:                   return .gray
           case .soccer:                       return .green
           case .softball:                     return .orange
           case .squash:                       return .blue
           case .stairClimbing:                return .gray
           case .surfingSports:                return .blue
           case .swimming:                     return .blue
           case .tableTennis:                  return .blue
           case .tennis:                       return .green
           case .trackAndField:                return .red
           case .traditionalStrengthTraining:  return .blue
           case .volleyball:                   return .orange
           case .walking:                      return .yellow
           case .waterFitness:                 return .blue
           case .waterPolo:                    return .blue
           case .waterSports:                  return .blue
           case .wrestling:                    return .red
           case .yoga:                         return .purple
           
           // iOS 10
           case .barre:                        return .purple
           case .coreTraining:                 return .blue
           case .crossCountrySkiing:           return .gray
           case .downhillSkiing:               return .gray
           case .flexibility:                  return .purple
           case .highIntensityIntervalTraining:return .blue
           case .jumpRope:                     return .orange
           case .kickboxing:                   return .red
           case .pilates:                      return .purple
           case .snowboarding:                 return .gray
           case .stairs:                       return .gray
           case .stepTraining:                 return .blue
           case .wheelchairWalkPace:           return .yellow
           case .wheelchairRunPace:            return .yellow
           
           // iOS 11
           case .taiChi:                       return .purple
           case .mixedCardio:                  return .blue
           case .handCycling:                  return .yellow
           
           // iOS 13
           case .discSports:                   return .blue
           case .fitnessGaming:                return .green
           
           // Catch-all
           default:                            return .gray
           }
       }

}
