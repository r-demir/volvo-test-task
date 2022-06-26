//
//  City.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import Foundation

enum City: String, CaseIterable {
    case Gothenburg
    case Stockholm
    case MountainView
    case London
    case NewYork
    case Berlin
    
    var asciiEncoded: String {
        switch self {
            case .MountainView:
                return "Mountain%20View"
            case .NewYork:
                return "New%20York"
            default:
                return self.rawValue
        }
    }
}
