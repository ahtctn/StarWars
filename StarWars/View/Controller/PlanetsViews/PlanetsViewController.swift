//
//  PlanetsViewController.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import UIKit

class PlanetsViewController: UIViewController {
    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    //MARK: PROPERTIES
    let viewModel = PlanetsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
        delegations()
    }
    
    private func delegations() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: Constants.NibName.planets, bundle: nil), forCellReuseIdentifier: Constants.Cell.planetsCellID)
    }
    
    private func observeEvent() {
        viewModel.getPlanetsData()
        viewModel.eventHandler = { [weak self] event in
            switch event {
            case .loading:
                print(Constants.EventMessages.loading)
            case .stopLoading:
                print(Constants.EventMessages.stopLoading)
            case .dataLoaded:
                print(Constants.NibName.planets)
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

extension PlanetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: PlanetsResultsModel
        item = self.viewModel.resultCell(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.planetsCellID, for: indexPath) as? PlanetsTableViewCell else { return UITableViewCell() }
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
