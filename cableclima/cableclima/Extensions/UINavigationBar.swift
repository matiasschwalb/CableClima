//
//  UINavigationBar.swift
//  cableclima
//
//  Created by Matias David Schwalb on 18/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

extension UINavigationBar {
    static func setupCustomAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor.ccRed
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
