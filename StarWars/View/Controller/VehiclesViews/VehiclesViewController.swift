//
//  VehiclesViewController.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import UIKit

class VehiclesViewController: UIViewController {

    let viewModel = VehiclesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
    }
    
    private func observeEvent() {
        viewModel.getVehiclesData()
        viewModel.eventHandler = { [weak self] event in
            switch event {
            case .loading:
                print(Constants.EventMessages.loading)
            case .stopLoading:
                print(Constants.EventMessages.stopLoading)
            case .dataLoaded:
                print(Constants.EventMessages.dataLoaded)
                self?.setUI()
            case .error(let error):
                print(error.localizedDescription as Any)
            }
        }
    }
    
    private func setUI() {
        
    }
}
