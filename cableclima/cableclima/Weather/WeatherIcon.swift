//
//  WeatherIcon.swift
//  cableclima
//
//  Created by Matias David Schwalb on 26/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit
import Foundation

class WeatherIcon {
    var image: UIImage?
    let id: String?
    
    init(withID id: String?) {
        self.id = id
        self.image = UIImage()
        self.fetchImage()
    }
    
    init() {
        self.id = nil
        self.image = nil
    }
    
    func fetchImage() {
        let request = IconRequest()
        self.image = request.getIcon(withIconID: id ?? "")
    }
}
