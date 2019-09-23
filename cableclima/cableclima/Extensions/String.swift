//
//  String.swift
//  cableclima
//
//  Created by Matias David Schwalb on 10/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation

extension String {
    
    public func localized(withArguments arguments: CVarArg..., bundle: Bundle = Bundle.main) -> String {
        let localized = NSLocalizedString(self, tableName: .none, bundle: bundle, value: "", comment: "")
        if !arguments.isEmpty {
            // Once inside the function, a CVarArg... becomes a [CVarArg]
            // and when passing it on to another function that receives CVarArg,
            // it interprets that you are passing only one CVarArg which is an array.
            return String(format: localized, arguments: arguments)
        }
        return localized
    }
    
    public func addAPIKey() -> String {
        return self + "&APPID=\(OpenWeatherConfiguration.APIKey)"
    }
}
