//
//  CCHomeDetailsViewCellModel.swift
//  cableclima
//
//  Created by Matias David Schwalb on 25/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class CCHomeDetailsViewCellModel: CCViewModel {
    let title: String
    let value: String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
}
