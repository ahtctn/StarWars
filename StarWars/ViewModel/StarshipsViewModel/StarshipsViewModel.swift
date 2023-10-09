//
//  StarshipsViewModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

class StarshipsViewModel {
    var starshipsModel: [StarshipResultsModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getStarshipData() {
        self.eventHandler?(.loading)
        
        NetworkManager.shared.getStarhipsData { result in
            switch result {
            case .success(let starships):
                self.starshipsModel = starships.results
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print("\(error.localizedDescription) Network error happened in StarshipsViewModel")
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.starshipsModel.count
    }
    
    func resultCell(at index: Int) -> StarshipResultsModel {
        return self.starshipsModel[index]
    }
}

extension StarshipsViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(_ error: Error?)
    }
}
