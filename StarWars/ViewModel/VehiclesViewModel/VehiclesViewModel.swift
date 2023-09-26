//
//  VehiclesViewModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

class VehiclesViewModel {
    var vehiclesModel: VehiclesModel?
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getVehiclesData() {
        self.eventHandler?(.loading)
        
        NetworkManager.shared.getVehiclesData { results in
            switch results {
            case .success(let vehicles):
                self.vehiclesModel = vehicles
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print("\(error.localizedDescription) Network error happened in VehiclesViewModel")
                self.eventHandler?(.error(error))
            }
        }
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
