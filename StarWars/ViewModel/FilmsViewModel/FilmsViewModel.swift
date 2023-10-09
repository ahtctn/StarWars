//
//  FilmsViewModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

class FilmsViewModel {
    var filmsModel: [FilmsResultsModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getFilmsData() {
        self.eventHandler?(.loading)
        
        NetworkManager.shared.getFilmsData { results in
            switch results {
            case .success(let films):
                self.filmsModel = films.results
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print("\(error.localizedDescription) Network error happened in FilmsViewModel")
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.filmsModel.count
    }
    
    func resultCell(at index: Int) -> FilmsResultsModel {
        return self.filmsModel[index]
    }
}

extension FilmsViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(_ error: Error?)
    }
}
