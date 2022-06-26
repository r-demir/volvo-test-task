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
    
    func getWeatherInfo(city: String = "London", callback: @escaping WeatherResponseHandler){
        self.weatherService.getWeatherInfo(city: city) { response in
            callback(response)
        }
    }
    
}

