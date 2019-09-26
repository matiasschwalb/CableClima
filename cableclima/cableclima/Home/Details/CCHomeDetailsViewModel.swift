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
            CCHomeDetailsViewCellModel(title: "Humedad", value: String(weather.main?.humidity ?? 0) ),
            CCHomeDetailsViewCellModel(title: "Presion", value: String(weather.main?.pressure ?? 0)),
            CCHomeDetailsViewCellModel(title: "Temperatura Maxima", value: String(weather.main?.temperatureList.max.value ?? 0)),
            CCHomeDetailsViewCellModel(title: "Temperatura Minima", value: String(weather.main?.temperatureList.min.value ?? 0)),
            CCHomeDetailsViewCellModel(title: "Descripcion", value: weather.description ?? "")
        ]
    }
}

