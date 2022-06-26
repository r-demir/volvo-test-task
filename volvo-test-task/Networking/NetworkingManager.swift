//
//  NetworkingManager.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit

class NetworkingManager: NSObject {
    static var shared = NetworkingManager()
    var weatherClient = WeatherAPIClient()
}

