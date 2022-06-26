//
//  NetworkingManager.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit
import SwiftyJSON


class NetworkingManager: NSObject {
    static var shared = NetworkingManager()
    private var weatherService = WeatherService()
}

extension NetworkingManager {
    
    func getWeatherInfo(latitude: Double = 35, longitude: Double = 139, callback: @escaping WeatherResponseHandler){
        self.weatherService.getWeatherInfo(latitude: latitude, longitude: longitude) { response in
            callback(response)
        }
    }
    
}

