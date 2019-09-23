//
//  CurrentWeather.swift
//  cableclima
//
//  Created by Matias David Schwalb on 22/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeatherRequest {
    
    typealias WeatherResult = (Result<String>) -> Void
    
    func loadCurrentWeather(withID id: Int, completion: @escaping WeatherResult) {
        
//        let url = OpenWeatherConfiguration.baseURL + "data/2.5/weather?q=London,uk".addAPIKey()
        let url = OpenWeatherConfiguration.currentWeatherPathWithID(id: id)
        
        AF.request(url).responseString { response in
            print(">>>> Response >>>>")
            print(response.description)
            completion(.success(response.description))
        }
    }
}
