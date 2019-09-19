//
//  CCWeather.swift
//  cableclima
//
//  Created by Matias David Schwalb on 18/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class CCWeather {
    
    let id: Int
    let main: CCMainWeather?
    let description: String?
    let icon: UIImage?
    
    init(id: Int, main: CCMainWeather, description: String, icon: UIImage) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}
