//
//  WeatherAPI.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

/*
    {
        "coord": {
            "lon": 139.123,
            "lat": 35.123
        },
        "weather": [
            {
                "id": 804,
                "main": "Clouds",
                "description": "overcast clouds",
                "icon": "04d"
            }
        ],
        "base": "stations",
        "main": {
            "temp": 302.21,
            "feels_like": 306.59,
            "temp_min": 300.35,
            "temp_max": 305.5,
            "pressure": 1013,
            "humidity": 73,
            "sea_level": 1013,
            "grnd_level": 1013
        },
        "visibility": 10000,
        "wind": {
            "speed": 5.13,
            "deg": 237,
            "gust": 9.62
        },
        "clouds": {
            "all": 93
        },
        "dt": 1656226113,
        "sys": {
            "type": 2,
            "id": 2019346,
            "country": "JP",
            "sunrise": 1656185442,
            "sunset": 1656237697
        },
        "timezone": 32400,
        "id": 1857692,
        "name": "Manazuru",
        "cod": 200
    }
 
*/



class WeatherAPIClient: NSObject {

    let API_KEY = "22297b9bbc346661f9509b825863bb57"
    let API_URL = "https://api.openweathermap.org/data/2.5/weather"
    
    func getWeatherInfo(latitude: Double = 35.123, longitude: Double = 139.123) {
        let url = API_URL + "?lat=\(latitude)&lon=\(longitude)&appid=\(API_KEY)"
        Alamofire.request(url).responseObject { (response: DataResponse<WeatherResponse>) in
            guard response.error == nil else {
                print("WeatherAPI: \(String(describing: response.error?.localizedDescription))")
                return
            }
            let weatherResponse = response.result.value
            print(weatherResponse)
        }
    }
    
}
