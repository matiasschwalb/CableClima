//
//  CCTabBarViewController.swift
//  cableclima
//
//  Created by Matias David Schwalb on 10/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class CCTabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 17)], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)], for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.ccRed
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.lightGray
        

        
        let home = HomeViewController()
        home.tabBarItem = UITabBarItem()
        home.tabBarItem.title = "tab_bar.home.title".localized()
        let fonts = UIFont.familyNames
        for font in fonts {
            print(font)
        }
//        home.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 17)], for: .selected)
//        home.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)], for: .normal)
        home.tabBarItem.image = UIImage(named: "weather")
        
        home.tabBarItem.tag = 0
        
        
        let forecast = CCViewController() // This should be changed to a specific controller
        forecast.tabBarItem = UITabBarItem()
        forecast.tabBarItem.title = "tab_bar.forecast.title".localized()
        forecast.tabBarItem.image = UIImage(named: "forecast")
        forecast.tabBarItem.tag = 1
//        forecast.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 17)], for: .selected)
        forecast.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)], for: .normal)
        
        viewControllers = [home, forecast]
    }
}
