//
//  Configuration.swift
//  cableclima
//
//  Created by Matias David Schwalb on 22/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation

class OpenWeatherConfiguration {
    
    static let APIKey = "8debee7c84e20231d30e05d54861355e"
    
    static let baseURL = "https://api.openweathermap.org/"
    
    static let currentWeatherPath = "data/2.5/weather?"
    
    static let metricSystemPath = "&units=metric"
    
    static func currentWeatherPathWithID(id: Int) -> String {
        return self.baseURL + self.currentWeatherPath  + "id=\(id)" + self.metricSystemPath.addAPIKey()
    }
}
