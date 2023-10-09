//
//  PeopleViewModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

class PeopleViewModel {
    var peopleModel: [PeopleResultsModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getPeopleData() {
        self.eventHandler?(.loading)
        NetworkManager.shared.getPeopleData { results in
            switch results {
            case .success(let people):
                self.peopleModel = people.results
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print("\(error.localizedDescription) Network Error happened in PeopleViewModel")
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.peopleModel.count
    }
    
    func resultCell(at index: Int) -> PeopleResultsModel {
        return self.peopleModel[index]
    }
}

extension PeopleViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(_ error: Error?)
    }
}
