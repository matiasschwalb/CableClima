//
//  Icon.swift
//  cableclima
//
//  Created by Matias David Schwalb on 26/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation
import Alamofire

class IconRequest {
    func getIcon(withIconID id: String) -> UIImage{
        guard let url = URL(string: "https://openweathermap.org/img/wn/\(id)@2x.png") else { return UIImage() }
        
        guard let data = try? Data(contentsOf: url) else { return UIImage() }
        
        return UIImage(data: data) ?? UIImage()
    }
}
