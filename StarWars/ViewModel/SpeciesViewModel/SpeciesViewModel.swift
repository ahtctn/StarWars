//
//  SpeciesViewModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

class SpeciesViewModel {
    var speciesModel: SpeciesModel?
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getSpeciesData() {
        self.eventHandler?(.loading)
        NetworkManager.shared.getSpeciesData { results in
            switch results {
            case .success(let species):
                self.speciesModel = species
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print("\(error.localizedDescription) Network Error Happened in SpeciesViewModel")
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension SpeciesViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(_ error: Error?)
    }
}
