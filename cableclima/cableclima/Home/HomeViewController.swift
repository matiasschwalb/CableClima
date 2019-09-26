//
//  HomeViewController.swift
//  cableclima
//
//  Created by Matias David Schwalb on 10/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import UIKit

class HomeViewController: CCViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var detailsView: UIView!
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.readyToRefresh = {
            self.setupUI()
            self.setupSubView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.updateWeather()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = viewModel.backgroundColor
        currentTemperatureLabel.text = viewModel.currentTemperature.formattedTemperature()
        weatherImage.image = viewModel.icon
        weatherLabel.text = viewModel.weather?.main?.type.stringValue
    }
    
    private func setupSubView() {
        detailsView.layer.cornerRadius = 10
        detailsView.layer.masksToBounds = true
        
        let detailsViewController = CCHomeDetailsViewController(withWeather: viewModel.weather ?? CCWeather())
        load(childViewController: detailsViewController, into: detailsView)
    }
}
