//
//  ViewController.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 25.09.2023.
//

import UIKit

class StarshipsViewController: UIViewController {
    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: PROPERTIES
    let viewModel = StarshipsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
        delegations()
        setUI()
    }
    
    private func setUI() {
        self.navigationItem.title = Constants.NavigationName.starships
    }
    
    private func delegations() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: Constants.NibName.starships, bundle: nil), forCellReuseIdentifier: Constants.Cell.starhipsCellID)
    }
    
    private func observeEvent() {
        viewModel.getStarshipData()
        viewModel.eventHandler = { [weak self] event in
            switch event {
            case .loading:
                print(Constants.EventMessages.loading)
            case .stopLoading:
                print(Constants.EventMessages.stopLoading)
            case .dataLoaded:
                print(Constants.NibName.starships)
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

extension StarshipsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: StarshipResultsModel
        
        item = self.viewModel.resultCell(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.starhipsCellID, for: indexPath) as? StarshipsTableViewCell else { return UITableViewCell() }
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(self.tableView.frame.height)
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStarship: StarshipResultsModel
        selectedStarship = viewModel.resultCell(at: indexPath.row)
        performSegue(withIdentifier: Constants.Detail.starshipsDetail, sender: selectedStarship)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case segue.identifier = Constants.Cell.starhipsCellID {
            if case segue.identifier = Constants.Cell.starhipsCellID {
                if let detailVC = segue.destination as? StarshipsDetailsViewController,
                   let selectedStarship = sender as? StarshipResultsModel {
                    detailVC.starships = selectedStarship
                }
            }
        }
    }
}

