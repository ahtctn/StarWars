//
//  FilmsViewController.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import UIKit

class FilmsViewController: UIViewController {
    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: PROPERTIES
    let viewModel = FilmsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegations()
        observeEvent()
    }
    
    private func delegations() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: Constants.NibName.films, bundle: nil), forCellReuseIdentifier: Constants.Cell.filmsCellID)
    }
    
    private func observeEvent() {
        viewModel.getFilmsData()
        viewModel.eventHandler = { [weak self] event in
            switch event {
            case .loading:
                print(Constants.EventMessages.loading)
            case .stopLoading:
                print(Constants.EventMessages.stopLoading)
            case .dataLoaded:
                print(Constants.NibName.species)
                print(Constants.EventMessages.dataLoaded)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .error(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
}

extension FilmsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: FilmsResultsModel
        item = self.viewModel.resultCell(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.filmsCellID, for: indexPath) as? FilmsTableViewCell else {
            return UITableViewCell() }
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
