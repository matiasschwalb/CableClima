//
//  CCWeather.swift
//  cableclima
//
//  Created by Matias David Schwalb on 18/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class CCWeather {
    
    let id: Int
    let main: CCMainWeather?
    let description: String?
    let icon: UIImage?
    
    init(id: Int, type: WeatherType?, pressure: Int?, humidity: Int?, currentTemperature: Float?, maxTemperature: Float?, minTemperature: Float?,  description: String?, icon: UIImage?) {
        self.id = id
        self.main = CCMainWeather(type: type, pressure: pressure, humidity: humidity, currentTemperature: currentTemperature, maxTemperature: maxTemperature, minTemperature: minTemperature) 
        self.description = description
        self.icon = icon
    }
}
