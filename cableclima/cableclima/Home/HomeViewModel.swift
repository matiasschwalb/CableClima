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
    var onWeatherError: ((String) -> Void)?
    
    var weather: CCWeather?
    
    override init() {
        super.init()
        setupBindings()
//        loadWeather(forID: )
    }

    func loadWeather(forID id: String) {
        let requestHandler = CurrentWeatherRequest()
        requestHandler.loadCurrentWeather(withID: Int(id) ?? 0) { result in
//  Download city list from http://bulk.openweathermap.org/sample/
            switch result {
                case .success(let weatherResult):
                    self.onWeatherLoaded?(weatherResult)
                    self.readyToRefresh?()
                case .error(let description):
                    print("Error in result: " + description)
                    self.onWeatherError?(description)
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
        case .clouds:
            return UIColor.ccCreamyWhite
        case .drizzle:
            return UIColor.lightGray
        case .rain:
            return UIColor.gray
        case .snow:
            return UIColor.white
        case .thunderstorm:
            return UIColor.yellow
        default:
            return UIColor.gray
        }
    }
    
    var city: String {
        return weather?.city ?? ""
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
        return weather?.icon.image ?? UIImage()
    }
    
    var pressure: Int {
        return weather?.main?.pressure ?? 0
    }
    
    var humidity: Int {
        return weather?.main?.humidity ?? 0
    }
}
