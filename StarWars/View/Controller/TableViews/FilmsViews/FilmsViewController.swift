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
        setUI()
    }
    
    private func setUI() {
        self.navigationItem.title = Constants.NavigationName.films
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFilm: FilmsResultsModel
        selectedFilm = viewModel.resultCell(at: indexPath.row)
        performSegue(withIdentifier: Constants.Detail.filmsDetail, sender: selectedFilm)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case segue.identifier = Constants.Cell.filmsCellID {
            if let detailVC = segue.destination as? FilmsDetailsViewController,
               let selectedFilm = sender as? FilmsResultsModel {
                detailVC.films = selectedFilm
            }
        }
    }
}
