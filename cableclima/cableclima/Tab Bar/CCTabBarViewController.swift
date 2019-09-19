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
        
        setupAppearence()
        
        let home = CCTabs(withType: .home)
        let forecast = CCTabs(withType: .forecast)
        let settings = CCTabs(withType: .settings)
        
        viewControllers = [home.viewController, forecast.viewController, settings.viewController] as? [UIViewController]
    }
    
    private func setupAppearence() {
        UITabBar.appearance().tintColor = UIColor.ccRed
        
    }
}

