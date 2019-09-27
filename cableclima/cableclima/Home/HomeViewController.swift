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
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var countryCodeTextView: UITextField!
    @IBOutlet weak var countryCodeButton: UIButton!
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTextView()
        setupUI()
        viewModel.readyToRefresh = {
            self.setupUI()
            self.setupSubView()
        }
        
        viewModel.onWeatherError = { description in
            
            let alert = UIAlertController(title: "error_title".localized(), message: description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        viewModel.updateWeather()
        setupUI()
    }
    
    private func setupTextView() {
        countryCodeTextView.keyboardType = .asciiCapableNumberPad
    }
    
    private func setupButton() {
        countryCodeButton.backgroundColor = UIColor.ccOrange
        countryCodeButton.tintColor = UIColor.white
        countryCodeButton.layer.cornerRadius = 8
//        countryCodeButton.titleLabel?.text = "Go"
        countryCodeButton.setTitle("Go", for: .normal)
        
        countryCodeButton.addTarget(self, action: #selector(self.buttonClick), for: .touchUpInside)
//        countryCodeButton.
    }
    
    @objc func buttonClick(sender: UIButton!) {
        guard let id = countryCodeTextView.text else { return }
        view.endEditing(true)
        viewModel.loadWeather(forID: id)
    }
    
    private func setupUI() {
        view.backgroundColor = viewModel.backgroundColor
        currentTemperatureLabel.text = viewModel.currentTemperature.formattedTemperature()
        weatherImage.image = viewModel.icon
        weatherLabel.text = viewModel.weather?.main?.type.stringValue
        cityLabel.text = viewModel.city
        cityLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setupSubView() {
        detailsView.layer.cornerRadius = 10
        detailsView.layer.masksToBounds = true
        
        let detailsViewController = CCHomeDetailsViewController(withWeather: viewModel.weather ?? CCWeather())
        load(childViewController: detailsViewController, into: detailsView)
    }
}
