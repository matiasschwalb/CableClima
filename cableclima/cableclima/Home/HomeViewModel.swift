//
//  HomeViewModel.swift
//  cableclima
//
//  Created by Matias David Schwalb on 10/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel: CCViewModel {
    
    var weather: CCWeather?
    
    override init() {
        super.init()
        loadWeather()
    }
    
    func loadWeather() {
        self.weather = CCWeather(id: 1, type: .clear, pressure: 100, humidity: 100, currentTemperature: 24, maxTemperature: 30, minTemperature: 20, description: "Clear with no clouds", icon: UIImage(named: "weather"))
    }
    
    var backgroundColor: UIColor {
        switch type {
        case .clear:
            return UIColor.ccLightBlue
        default:
            return UIColor.gray
        }
    }
    
    var type: WeatherType {
        return weather?.main?.type ?? WeatherType.other
    }
    
    var currentTemperature: CCTemperature {
        return weather?.main?.temperatureList.current ?? CCTemperature(value: 0)
    }
    
    var maxTemperature: CCTemperature {
        return weather?.main?.temperatureList.max ?? CCTemperature(value: 0)
    }
    
    var minTemperature: CCTemperature {
        return weather?.main?.temperatureList.min ?? CCTemperature(value: 0)
    }
    
    var icon: UIImage {
        return weather?.icon ?? UIImage()
    }
    
    var pressure: Int {
        return weather?.main?.pressure ?? 0
    }
    
    var humidity: Int {
        return weather?.main?.humidity ?? 0
    }
}
