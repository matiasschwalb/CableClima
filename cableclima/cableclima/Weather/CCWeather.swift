//
//  CCWeather.swift
//  cableclima
//
//  Created by Matias David Schwalb on 18/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class CCWeather {
    
    let id: Int?
    let main: CCMainWeather?
    let description: String?
    let icon: WeatherIcon
    
    init() {
        self.id = 0
        self.main = CCMainWeather(type: .other, pressure: 0, humidity: 0, currentTemperature: 20, maxTemperature: 0, minTemperature: 0)
        self.description = "null"
        self.icon = WeatherIcon()
    }
    
    init(id: Int, type: WeatherType?, pressure: Int?, humidity: Int?, currentTemperature: Float?, maxTemperature: Float?, minTemperature: Float?,  description: String?, icon: String?) {
        self.id = id
        self.main = CCMainWeather(type: type, pressure: pressure, humidity: humidity, currentTemperature: currentTemperature, maxTemperature: maxTemperature, minTemperature: minTemperature) 
        self.description = description
        self.icon = WeatherIcon(withID: icon)
        self.icon.fetchImage()
    }
}
