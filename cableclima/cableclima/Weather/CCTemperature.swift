//
//  CCTemperature.swift
//  cableclima
//
//  Created by Matias David Schwalb on 18/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation

class CCTemperatureList {
    let current: CCTemperature
    let max: CCTemperature
    let min: CCTemperature
    
    init(current: Float, max: Float, min: Float) {
        self.current = CCTemperature(value: current, type: .current)
        self.max = CCTemperature(value: max, type: .max)
        self.min = CCTemperature(value: min, type: .min)
    }
}

class CCTemperature {
    let value: Float
    let type: TemperatureType
    let unit: TemperatureUnit
    
    init(value: Float, type: TemperatureType = TemperatureType.any, unit: TemperatureUnit = TemperatureUnit.celsius) {
        self.value = value
        self.type = type
        self.unit = unit
    }
}

enum TemperatureType {
    case max
    case min
    case current
    case any
}

enum TemperatureUnit: String {
    case celsius = "ºC"
    case farenheit = "ºF"
}
