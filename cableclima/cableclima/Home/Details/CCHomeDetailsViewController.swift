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
    
    let cells = ["Humedad", "Presion", "Temperatura Maxima", "Temperatura Minima", "Descripcion"]
    
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
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return _view.bounds.height / CGFloat(tableView.numberOfRows(inSection: 0))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CCHomeDetailsViewCell.xibFileName) as? CCHomeDetailsViewCell else { return UITableViewCell() }
        
        let cellData = cells[indexPath.row]
        
        cell.titleLabel.text = cellData
        cell.valueLabel.text = "85%"
        
        return cell
    }
}
