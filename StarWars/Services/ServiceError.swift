//
//  ServiceError.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 25.09.2023.
//

import Foundation

enum ServiceError: Error {
case invalidURL
case invalidResponse
case invalidData
case decodingError(_ error: Error)
}
