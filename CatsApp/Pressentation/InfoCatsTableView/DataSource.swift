//
//  DataSource.swift
//  CatsApp
//
//  Created by Mariam Joglidze on 18.11.23.
//

import UIKit

// MARK: - TableVIew DataSource
final class CatsDataSourse: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private let viewModel: CatsListViewModel
    private var cats = [CatsViewModel]()
    private var tableView: UITableView
    
    init(tableView: UITableView, viewModel: CatsListViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        
        viewModel.fetchCatsFacts()
        viewModel.onReceivedCat = { [weak self] cat in
            self?.cats = cat
            tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell {
            cell.configure(with: cats[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
