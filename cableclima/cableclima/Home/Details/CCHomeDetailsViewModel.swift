//
//  CCHomeDetailsViewModel.swift
//  cableclima
//
//  Created by Matias David Schwalb on 20/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation

class CCHomeDetailsViewModel: CCViewModel {
    let weather: CCWeather
    
    let cellViewModels: [CCHomeDetailsViewCellModel]

    init(withWeather weather: CCWeather) {
        self.weather = weather
        cellViewModels = [
            CCHomeDetailsViewCellModel(title: "Humedad", value: weather.main?.humidityWithUnits() ?? ""),
            CCHomeDetailsViewCellModel(title: "Presion", value: weather.main?.pressureWithUnits() ?? ""),
            CCHomeDetailsViewCellModel(title: "Temperatura Maxima", value: weather.main?.temperatureList.max.formattedTemperature() ?? ""),
            CCHomeDetailsViewCellModel(title: "Temperatura Minima", value: weather.main?.temperatureList.min.formattedTemperature() ?? ""),
            CCHomeDetailsViewCellModel(title: "Descripcion", value: weather.description ?? "")
        ]
    }
}

