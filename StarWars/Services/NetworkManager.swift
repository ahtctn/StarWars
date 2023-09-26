//
//  NetworkManager.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 25.09.2023.
//

import Foundation

typealias NetworkResult <T: Decodable> = Result<T, ServiceError>
typealias NetworkCompletion <T: Decodable> = (NetworkResult<T>) -> Void

class NetworkManager {
    static let shared = NetworkManager()
    let session = URLSession.shared
    private init () {}
    
    private func request<T: Decodable> (_ endpoint: Endpoint<T>, completion: @escaping NetworkCompletion<T>) {
        let task = session.dataTask(with: endpoint.request()) { data, response, error in
            guard let data = data, error == nil else {
                print("URLSessionError: \(String(describing: error))")
                completion(.failure(.invalidData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("Invalid HTTP Response Status Code: \(httpResponse.statusCode)")
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
                completion(.failure(.decodingError(error)))
            }
        }
        
        task.resume()
    }
    
    func getStarhipsData(completion: @escaping NetworkCompletion<StarshipsModel>) {
        let endpoint = Endpoint<StarshipsModel>.getStarships
        request(endpoint, completion: completion)
    }
    
    func getVehiclesData(completion: @escaping NetworkCompletion<VehiclesModel>) {
        let endpoint = Endpoint<VehiclesModel>.getVehicles
        request(endpoint, completion: completion)
    }
    
    func getSpeciesData(completion: @escaping NetworkCompletion<SpeciesModel>) {
        let endpoint = Endpoint<SpeciesModel>.getSpecies
        request(endpoint, completion: completion)
    }
    
    func getFilmsData(completion: @escaping NetworkCompletion<FilmsModel>) {
        let endpoint = Endpoint<FilmsModel>.getFilms
        request(endpoint, completion: completion)
    }
    
    func getPeopleData(completion: @escaping NetworkCompletion<PeopleModel>) {
        let endpoint = Endpoint<PeopleModel>.getPepople
        request(endpoint, completion: completion)
    }
    
    func getPlanetsData(completion: @escaping NetworkCompletion<PlanetsModel>) {
        let endpoint = Endpoint<PlanetsModel>.getPlanets
        request(endpoint, completion: completion)
    }
    
}
