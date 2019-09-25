//
//  CurrentWeather.swift
//  cableclima
//
//  Created by Matias David Schwalb on 22/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentWeatherRequest {
    
    struct WeatherFullResponse: Codable {
        let main: MainWeatherResponse
        let weather: WeatherResponse
    }
    
    struct MainWeatherResponse: Codable {
        let humidity: Int
        let pressure: Int
        let temp: String
        let temp_max: String
        let temp_min: String
    }
    
    struct WeatherResponse: Codable  {
        let description: String
        let icon: String
        let id: Int
        let main: String
    }
    
    typealias WeatherResult = (Result<CCWeather>) -> Void
    
    func loadCurrentWeather(withID id: Int, completion: @escaping WeatherResult) {
        
//        let url = OpenWeatherConfiguration.baseURL + "data/2.5/weather?q=London,uk".addAPIKey()
        let url = OpenWeatherConfiguration.currentWeatherPathWithID(id: id)
        
//        AF.request(url).responseString { response in
//            r
////            print(">>>> Response >>>>")
////            print(response.description)
//            completion(.success(response.description))
//        }
        
        AF.request(url).responseJSON { response in
            
            guard let jsonData = response.value else {
                completion(.error("Error generating JSON"))
                return
            }
            
            let json = JSON(jsonData)
            
            let id = json["id"].int
            let type = json["weather"][0]["Main"].string
            let pressure = json["main"]["pressure"].int
            let humidity = json["main"]["humidity"].int
            let currentTemperature = json["main"]["temp"].float
            let maxTemperature = json["main"]["temp_max"].float
            let minTemperature = json["main"]["temp_min"].float
            let description = json["weather"][0]["description"].string
            let icon = UIImage()
            
            let weather = CCWeather(id: id ?? 0, type: WeatherType(fromRawValue: type ?? ""), pressure: pressure, humidity: humidity, currentTemperature: currentTemperature, maxTemperature: maxTemperature, minTemperature: minTemperature, description: description, icon: icon)
            
            completion(.success(weather))
        }
    }
}
