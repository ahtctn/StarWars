//
//  VehiclesViewModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

class VehiclesViewModel {
    var vehiclesModel: [VehiclesResultsModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getVehiclesData() {
        self.eventHandler?(.loading)
        
        NetworkManager.shared.getVehiclesData { results in
            switch results {
            case .success(let vehicles):
                self.vehiclesModel = vehicles.results
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print("\(error.localizedDescription) Network error happened in VehiclesViewModel")
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.vehiclesModel.count
    }
    
    func resultCell(at index: Int) -> VehiclesResultsModel {
        return self.vehiclesModel[index]
    }
}

extension VehiclesViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(_ error: Error)
    }
}
