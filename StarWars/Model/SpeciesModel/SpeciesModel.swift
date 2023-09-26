//
//  SpeciesModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

struct SpeciesModel: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [SpeciesResultsModel]
}
