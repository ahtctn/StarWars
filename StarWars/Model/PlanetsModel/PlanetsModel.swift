//
//  PlanetsModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

struct PlanetsModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PlanetsResultsModel]
}

// MARK: - Result
