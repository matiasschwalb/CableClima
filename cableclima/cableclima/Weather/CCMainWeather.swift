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
    
    func pressureWithUnits() -> String {
        return String(pressure) + CCUnits.pressureUnits
    }
    
    func humidityWithUnits() -> String {
        return String(humidity) + CCUnits.humidityUnits
    }
}

enum WeatherType: String {
    case thunderstorm = "Thunderstorm"
    case drizzle = "Drizzle"
    case rain = "Rain"
    case snow = "Snow"
    case clear = "Clear"
    case clouds = "Clouds"
    case other
    
    init(fromRawValue: String) {
        self = WeatherType(rawValue: fromRawValue) ?? .other
    }
    
    var stringValue: String {
        return self.rawValue
    }
    
}
