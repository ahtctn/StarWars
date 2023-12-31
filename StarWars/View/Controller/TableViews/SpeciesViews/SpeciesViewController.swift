//
//  SpeciesViewController.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import UIKit

class SpeciesViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: PROPERTIES
    let viewModel = SpeciesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegations()
        observeEvent()
        setUI()
    }
    
    private func setUI() {
        self.navigationItem.title = Constants.NavigationName.species
    }
    
    private func delegations() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: Constants.NibName.species, bundle: nil), forCellReuseIdentifier: Constants.Cell.speciesCellID)
    }
    
    private func observeEvent() {
        viewModel.getSpeciesData()
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

extension SpeciesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: SpeciesResultsModel
        item = self.viewModel.resultCell(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.speciesCellID, for: indexPath) as? SpeciesTableViewCell else { return UITableViewCell() }
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
        let selectedSpecie: SpeciesResultsModel
        selectedSpecie = viewModel.resultCell(at: indexPath.row)
        performSegue(withIdentifier: Constants.Detail.speciesDetail, sender: selectedSpecie)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case segue.identifier = Constants.Cell.speciesCellID {
            if let detailVC = segue.destination as? SpeciesDetailsViewController,
               let selectedSpecie = sender as? SpeciesResultsModel {
                detailVC.species = selectedSpecie
            }
        }
    }
}
