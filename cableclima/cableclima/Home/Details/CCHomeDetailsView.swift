//
//  CCHomeDetailsView.swift
//  cableclima
//
//  Created by Matias David Schwalb on 20/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class CCHomeDetailsView: CCViewController, NibLoadable {
    
    init() {
        let (nibName, bundle) = type(of: self).nibNameAndBundle()
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
