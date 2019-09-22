//
//  CCMainWeather.swift
//  cableclima
//
//  Created by Matias David Schwalb on 18/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation

class CCMainWeather {
    let type: WeatherType
    let temperatureList: CCTemperatureList
    let pressure: Int
    let humidity: Int
    
    init(type: WeatherType?, pressure: Int?, humidity: Int?, currentTemperature: Float?, maxTemperature: Float?, minTemperature: Float?) {
        self.type = type ?? .other
        self.pressure = pressure ?? 0
        self.humidity = humidity ?? 0
        self.temperatureList = CCTemperatureList(current: currentTemperature ?? 0,
                                                 max: maxTemperature ?? 0,
                                                 min: minTemperature ?? 0)
    }
}

enum WeatherType {
    case thunderstorm
    case drizzle
    case rain
    case snow
    case clear
    case clouds
    case other
}
