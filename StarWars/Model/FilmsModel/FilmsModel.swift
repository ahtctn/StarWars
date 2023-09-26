//
//  FilmsModel.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 26.09.2023.
//

import Foundation

struct FilmsModel: Codable {
    let count: Int
    let next, previous: String?
    let results: [FilmResultsModel]
}
