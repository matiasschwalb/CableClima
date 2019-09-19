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
}
