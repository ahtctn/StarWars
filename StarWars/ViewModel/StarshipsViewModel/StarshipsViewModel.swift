//
//  StarshipsViewModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

class StarshipsViewModel {
    var starshipsModel: StarshipsModel?
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getStarshipData() {
        self.eventHandler?(.loading)
        
        NetworkManager.shared.getStarhipsData { result in
            switch result {
            case .success(let starships):
                self.starshipsModel = starships
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print("\(error.localizedDescription) Network error happened in StarshipsViewModel")
                self.eventHandler?(.error(error))
            }
        }
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
