//
//  ViewController.swift
//  CatsApp
//
//  Created by Mariam Joglidze on 18.11.23.
//

import UIKit
import Networking

final class CatsListViewController: UIViewController {

    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var viewModel: CatsListViewModel!
    private var catsService: CatsService!
    private var dataSource: CatsDataSourse!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        tableView.estimatedRowHeight = 100 
        tableView.rowHeight = UITableView.automaticDimension

        setupSubviews()
        setupConstrains()
        setupTableView()
        configureViewModel()
    }
    
    // MARK: - Private Methods
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupTableView() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    private func configureViewModel() {
        catsService = CatsService(webServiceManager: WebServiceManger())
        viewModel = CatsListViewModel(catsService: catsService)
        dataSource = CatsDataSourse(tableView: tableView, viewModel: viewModel)
    }

}

