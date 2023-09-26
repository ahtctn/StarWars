//
//  FilmsViewModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

class FilmsViewModel {
    var filmsModel: FilmsModel?
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getFilmsData() {
        self.eventHandler?(.loading)
        
        NetworkManager.shared.getFilmsData { results in
            switch results {
            case .success(let films):
                self.filmsModel = films
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print("\(error.localizedDescription) Network error happened in FilmsViewModel")
                self.eventHandler?(.error(error))
            }
        }
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
