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
        setUI()
    }
    
    private func setUI() {
        self.navigationItem.title = Constants.NavigationName.planets
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlanet: PlanetsResultsModel
        selectedPlanet = viewModel.resultCell(at: indexPath.row)
        performSegue(withIdentifier: Constants.Detail.planetsDetail, sender: selectedPlanet)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case segue.identifier = Constants.Cell.planetsCellID {
            if let detailVC = segue.destination as? PlanetsDetailsViewController,
               let selectedPlanet = sender as? PlanetsResultsModel {
                detailVC.planets = selectedPlanet
            }
        }
    }
}
