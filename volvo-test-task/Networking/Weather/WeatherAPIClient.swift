//
//  WeatherAPI.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit
import Alamofire
import AlamofireObjectMapper


typealias WeatherResponseHandler = (WeatherResponse?)->()

class WeatherAPIClient: NSObject {

    let API_KEY = "22297b9bbc346661f9509b825863bb57"
    let API_URL = "https://api.openweathermap.org/data/2.5/weather"
    
    func getWeatherInfo(latitude: Double, longitude: Double, callback: @escaping WeatherResponseHandler) {
        let url = API_URL + "?lat=\(latitude)&lon=\(longitude)&appid=\(API_KEY)"
        Alamofire.request(url).responseObject { (response: DataResponse<WeatherResponse>) in
            if let error = response.error {
                print("WeatherAPI::getWeatherInfo | \(error.localizedDescription)")
            }
            callback(response.value)
        }
    }
    
}
