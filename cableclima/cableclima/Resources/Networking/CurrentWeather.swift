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
    
    typealias WeatherResult = (Result<CCWeather>) -> Void
    
    func loadCurrentWeather(withID id: Int, completion: @escaping WeatherResult) {

        let url = OpenWeatherConfiguration.currentWeatherPathWithID(id: id)
        
        AF.request(url).responseJSON { response in
            
            guard let jsonData = response.value else {
                completion(.error("Error generating JSON"))
                return
            }
            
            let json = JSON(jsonData)
            
            print(json)
            
            let id = json["id"].int
            let type = json["weather"][0]["main"].string
            let pressure = json["main"]["pressure"].int
            let humidity = json["main"]["humidity"].int
            let currentTemperature = json["main"]["temp"].float
            let maxTemperature = json["main"]["temp_max"].float
            let minTemperature = json["main"]["temp_min"].float
            let description = json["weather"][0]["description"].string
            let icon = json["weather"][0]["icon"].string
            let city = json["name"].string
            
            let weather = CCWeather(id: id ?? 0, type: WeatherType(fromRawValue: type ?? ""), pressure: pressure, humidity: humidity, currentTemperature: currentTemperature, maxTemperature: maxTemperature, minTemperature: minTemperature, description: description, icon: icon, city: city)
            
            completion(.success(weather))
        }
    }
}
