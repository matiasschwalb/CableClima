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
    
    var onWeatherLoaded: ((CCWeather) -> Void)?
    var readyToRefresh: (() -> Void)?
    
    var weather: CCWeather?
    
    override init() {
        super.init()
        setupBindings()
        loadWeather()
    }
    
    func loadWeather() {
        let requestHandler = CurrentWeatherRequest()
        requestHandler.loadCurrentWeather(withID: 3433955) { result in

            switch result {
                case .success(let weatherResult):
                    self.onWeatherLoaded?(weatherResult)
                    self.readyToRefresh?()
                case .error(let description):
                    print("Error in result: " + description)
            }
        }
    }
    
    func setupBindings() {
        onWeatherLoaded = { weather in
            self.weather = weather
        }
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
