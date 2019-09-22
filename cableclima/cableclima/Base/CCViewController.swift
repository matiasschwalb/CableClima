//
//  CCViewController.swift
//  cableclima
//
//  Created by Matias David Schwalb on 10/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class CCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomView()
    }
    
    func setupCustomView() {
        view.backgroundColor = UIColor.ccCreamyWhite
    }

    public func load(childViewController: CCViewController, into containerView: UIView) {
        containerView.addSubview(childViewController.view)
    }
}
