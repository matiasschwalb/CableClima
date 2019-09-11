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
        
        tabBar.barTintColor = UIColor.ccRed
        
        let home = HomeViewController()
        home.tabBarItem = UITabBarItem()
        home.tabBarItem.title = "tab_bar.home.title".localized()
//        home.tabBarItem.image =
        home.tabBarItem.tag = 0
        
        let forecast = CCViewController() // This should be changed to a specific controller
        forecast.tabBarItem = UITabBarItem()
        forecast.tabBarItem.title = "tab_bar.forecast.title".localized()
//        forecast.tabBarItem.image =
        forecast.tabBarItem.tag = 1
        
        viewControllers = [home, forecast]
    }
}
