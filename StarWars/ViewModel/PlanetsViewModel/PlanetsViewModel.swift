//
//  PlanetsViewModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

class PlanetsViewModel {
    var planetsModel: [PlanetsResultsModel] = []
    var eventHandler: ((_ event: Event) -> Void)?

    func getPlanetsData() {
        self.eventHandler?(.loading)
        NetworkManager.shared.getPlanetsData { results in
            switch results {
            case .success(let planets):
                self.planetsModel = planets.results
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print("\(error.localizedDescription) Network error happened in PlanetsViewModel")
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.planetsModel.count
    }
    
    func resultCell(at index: Int) -> PlanetsResultsModel {
        return self.planetsModel[index]
    }
}

extension PlanetsViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(_ error: Error?)
    }
}
