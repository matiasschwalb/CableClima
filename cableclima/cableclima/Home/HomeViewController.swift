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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailsView: UIView!
    
    let detailsViewController: CCHomeDetailsViewController = CCHomeDetailsViewController()
    
    let viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSubView()
        loadData()
        viewModel.readyToRefresh = {
            self.setupUI()
        }
    }
    
    private func setupUI() {
        
        view.backgroundColor = viewModel.backgroundColor
        
        currentTemperatureLabel.text = viewModel.currentTemperature.formattedTemperature()
        weatherImage.image = viewModel.icon
    }
    
    private func setupSubView() {
        load(childViewController: detailsViewController, into: detailsView)
    }
    
    private func loadData() {
        let requestHandler = CurrentWeatherRequest()
        requestHandler.loadCurrentWeather(withID: 3433955) { result in
//            print(result)
        }
        
        let citiesParser = JSONCitiesParser()
        citiesParser.parse()
    }
}
