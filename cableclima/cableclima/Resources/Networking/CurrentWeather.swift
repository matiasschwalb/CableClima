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
    
    func loadCurrentWeather() {
        AF.request("https://api.openweathermap.org/data/2.5/weather?id=2172797").responseString { response in
            print(">>>> Response >>>>")
            print(response)
        }
    }
}
