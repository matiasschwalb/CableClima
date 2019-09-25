//
//  File.swift
//  cableclima
//
//  Created by Matias David Schwalb on 22/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation
import UIKit

struct ResponseData: Decodable {
    var city: [City]
}

struct City: Decodable {
    let id: Int
    let name: String
    let country: String
    let coord: Coordinates
}

struct Coordinates: Decodable {
    let lon: Float
    let lat: Float
}

/*
 
 {
 "id": 707860,
 "name": "Hurzuf",
 "country": "UA",
 "coord": {
 "lon": 34.283333,
 "lat": 44.549999
 }
 }
 
 */

class JSONCitiesParser {
    
    func parse() {
//        if let path = Bundle.main.path(forResource: "city.list.json", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
//                    print("Parsing successful!!")
//                    print(jsonResult)
//                }
//            } catch {
//                // Error handling
//                print("Parsing Error!!")
//            }
//        } else {
//            print("Error: path not found")
//        }
        
        if let url = Bundle.main.url(forResource: "city.list", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                print(data)
                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(ResponseData.self, from: data)
                let jsonData = try JSONSerialization.jsonObject(with: data) as! [[String: String]]
                print(jsonData[2])
            } catch {
                print("Error: File not found!")
            }
        }
    }
}
