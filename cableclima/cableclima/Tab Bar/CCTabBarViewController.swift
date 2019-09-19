//
//  CCTabBarViewController.swift
//  cableclima
//
//  Created by Matias David Schwalb on 10/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class CCTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearence()
        
        let home = CCTabs(withType: .home)
        let forecast = CCTabs(withType: .forecast)
        let settings = CCTabs(withType: .settings)
        let cities = CCTabs(withType: .cities)
        
        viewControllers = [home.navigationController, forecast.navigationController, cities.navigationController, settings.navigationController] as? [UIViewController]
    }
    
    private func setupAppearence() {
        UITabBar.appearance().tintColor = UIColor.ccRed
    }
}

