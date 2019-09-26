//
//  CCTabs.swift
//  cableclima
//
//  Created by Matias David Schwalb on 18/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class CCTabs {
    
    init(withType type: CCTabType) {
        self.type = type
        setupTab()
    }
    
    let type: CCTabType
    
    var viewController: CCViewController?
    
    var navigationController: UINavigationController?
    
    var image: UIImage? {
        switch type {
        case .home:
            return UIImage(named: "weather")
        case .forecast:
            return UIImage(named: "forecast")
        case .cities:
            return UIImage(named: "map")
        case .settings:
            return UIImage(named: "settings")
        default:
            return UIImage()
        }
    }
    
    var selectedImage: UIImage? {
        switch type {
        case .home:
            return UIImage(named: "weather-filled")
        case .forecast:
            return UIImage(named: "forecast-filled")
        case .cities:
            return UIImage(named: "map-filled")
        case .settings:
            return UIImage(named: "settings-filled")
        default:
            return UIImage()
        }
    }
    
    var title: String? {
        switch type {
        case .home:
            return "tab_bar.home.title".localized()
        case .forecast:
            return "tab_bar.forecast.title".localized()
        case .cities:
            return "tab_bar.cities.title".localized()
        case .settings:
            return "tab_bar.settings.title".localized()
        default:
            return nil
        }
    }
    
    var tag: Int {
        switch type {
        case .home:
            return 0
        case .forecast:
            return 1
        case .cities:
            return 2
        case .settings:
            return 3
        }
    }
    
    func setupTab() {
        
        switch type {
        case .home:
            viewController = HomeViewController()
//        case .forecast:
//            viewController = HomeViewController()
        default:
            viewController = CCViewController()
        }
        
        viewController?.tabBarItem = UITabBarItem()
        viewController?.tabBarItem.title = title
        viewController?.tabBarItem.image = image
        viewController?.tabBarItem.selectedImage = selectedImage
        viewController?.tabBarItem.tag = tag
        viewController?.title = title
        
        navigationController = UINavigationController(rootViewController: viewController ?? CCViewController())
    }
}

enum CCTabType {
    case home
    case forecast
    case settings
    case cities
}
