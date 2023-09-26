//
//  StarshipsModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

struct StarshipsModel: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [StarshipResultsModel]
}
