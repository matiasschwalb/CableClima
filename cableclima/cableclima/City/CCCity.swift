//
//  CCCity.swift
//  cableclima
//
//  Created by Matias David Schwalb on 27/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation

class CCCity {
    
    let id: Int?
    let name: String?
    let country:  String?
    
    init(id: Int? = nil, name: String? = nil, country: String? = nil) {
        self.id = id
        self.name = name
        self.country = country
    }
}
