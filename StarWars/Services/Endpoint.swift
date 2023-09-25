//
//  Endpoint.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 25.09.2023.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String]? { get }
    var parameters: [String : Any]? { get }
    func request() -> URLRequest
}

enum Endpoint<T: Decodable> {
    case getPepople
    case getPlanets
    case getFilms
    case getSpecies
    case getVehicles
    case getStarships
}

extension Endpoint: EndpointProtocol {
    var baseURL: String {
        return Constants.baseURL
    }
    
    var path: String {
        switch self {
        case .getPepople:
            return Constants.Path.people
        case .getPlanets:
            return Constants.Path.planets
        case .getFilms:
            return Constants.Path.films
        case .getSpecies:
            return Constants.Path.species
        case .getVehicles:
            return Constants.Path.vehicles
        case .getStarships:
            return Constants.Path.starships
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPepople:
            return .get
        case .getPlanets:
            return .get
        case .getFilms:
            return .get
        case .getSpecies:
            return .get
        case .getVehicles:
            return .get
        case .getStarships:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL + path) else {
            fatalError("base url error")
        }
        
        if let parameters = parameters {
            components.queryItems = parameters.map({ key, value in
                URLQueryItem(name: key, value: "\(value)")
            })
        }
        
        guard let url = components.url else { fatalError("wrong url")}
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let header = headers {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
    
    
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}
