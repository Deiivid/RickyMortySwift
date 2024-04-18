//
//  RickyMortyService.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation


class RickyMortyService {
    private let baseUrlString = "https://rickandmortyapi.com/api/"

    func getCharacters(completion: @escaping ([Character]?, Error?) -> Void) {
        let charactersUrl = baseUrlString + "character/"
        guard let url = URL(string: charactersUrl) else {
            completion(nil, NSError(domain: "", code: -1, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                do {
                    let charactersResponse = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    completion(charactersResponse.results, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    func getLocations(completion: @escaping ([Location]?, Error?) -> Void) {
            let locationsUrl = baseUrlString + "location/"
            guard let url = URL(string: locationsUrl) else {
                completion(nil, NSError(domain: "", code: -1, userInfo: nil))
                return
            }

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                } else if let data = data {
                    do {
                        let locationsResponse = try JSONDecoder().decode(LocationsResponse.self, from: data)
                        completion(locationsResponse.results, nil)
                    } catch {
                        completion(nil, error)
                    }
                }
            }
            task.resume()
        }
    
    func fetchCharacter(from url: String, completion: @escaping (Character?) -> Void) {
            guard let url = URL(string: url) else {
                completion(nil)
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let character = try? decoder.decode(Character.self, from: data) {
                    completion(character)
                } else {
                    completion(nil)
                }
            }.resume()
        }
    
    func getEpisodes(completion: @escaping ([Episode]?, Error?) -> Void) {
        let episodesUrl = baseUrlString + "episode/"
        guard let url = URL(string: episodesUrl) else {
            completion(nil, NSError(domain: "", code: -1, userInfo: nil))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                do {
                    let episodesResponse = try JSONDecoder().decode(EpisodesResponse.self, from: data)
                    completion(episodesResponse.results, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
}
