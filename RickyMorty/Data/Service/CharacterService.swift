//
//  CharacterService.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import SwiftUI

class CharacterService {
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
}
