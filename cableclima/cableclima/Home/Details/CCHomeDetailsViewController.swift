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
    
    let viewModel: CCHomeDetailsViewModel
    
    init(withWeather weather: CCWeather) {
        self.viewModel = CCHomeDetailsViewModel(withWeather: weather)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.ccOrange

        _view.detailsTable.delegate = self
        _view.detailsTable.dataSource = self
        
        let cellXib = UINib.init(nibName: CCHomeDetailsViewCell.xibFileName, bundle: nil)
        _view.detailsTable.register(cellXib, forCellReuseIdentifier: CCHomeDetailsViewCell.xibFileName)
    }
}

extension CCHomeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return _view.bounds.height / CGFloat(tableView.numberOfRows(inSection: 0))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CCHomeDetailsViewCell.xibFileName) as? CCHomeDetailsViewCell else { return UITableViewCell() }
        
        let cellData = viewModel.cellViewModels[indexPath.row]
        
        cell.titleLabel.text = cellData.title
        cell.valueLabel.text = cellData.value
        
        return cell
    }
}
