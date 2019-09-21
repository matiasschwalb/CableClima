//
//  CCHomeDetailsViewController.swift
//  cableclima
//
//  Created by Matias David Schwalb on 21/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation
import UIKit

class CCHomeDetailsViewController: CCViewController {
    
    lazy var _view: CCHomeDetailsView = CCHomeDetailsView.loadFromNib()!
    
    override func loadView() {
        view = _view
    }
}
