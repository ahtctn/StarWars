//
//  ViewController.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 25.09.2023.
//

import UIKit

class StarshipsViewController: UIViewController {
    
    let viewModel = StarshipsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
        //deneme()
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
                print(Constants.EventMessages.dataLoaded)
                self?.setUI()
                self?.deneme()
            case .error(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    private func setUI() {
        
    }
    private func deneme() {
        DispatchQueue.main.async {
            
            guard let starships = self.viewModel.starshipsModel else { return }
            let starshipsData = starships.results
            
            for starship in starshipsData {
                print(starship.cargoCapacity)
                print("Films: \(starship.films)")
                print("Name: \(starship.name)")
                print("Class: \(starship.starshipClass)")
                print("açıldı")
            }
            
        }
    }


}

