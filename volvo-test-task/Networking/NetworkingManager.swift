//
//  NetworkingManager.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit
import Alamofire


class NetworkingManager: NSObject {
    static var shared = NetworkingManager()
    static var isConnected: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    private var weatherService = WeatherService()
}

extension NetworkingManager {
    
    func getWeatherInfo(city: City, callback: @escaping WeatherResponseHandler){
        self.weatherService.getWeatherInfo(city: city.asciiEncoded) { response in
            callback(response)
        }
    }
    
}

