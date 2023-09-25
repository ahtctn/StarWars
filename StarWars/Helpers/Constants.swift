//
//  Constants.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 25.09.2023.
//

import Foundation

enum Constants {
    static let baseURL: String = "https://swapi.dev/api/"
    
    enum Path {
        static let people: String = "people/"
        static let planets: String = "planets/"
        static let films: String = "films/"
        static let species: String = "species/"
        static let vehicles: String = "vehicles/"
        static let starships: String = "starships/"
    }
}

