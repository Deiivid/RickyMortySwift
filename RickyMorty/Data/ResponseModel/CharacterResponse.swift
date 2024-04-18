//
//  CharacterResponse.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation

struct Character: Codable, Identifiable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}

struct CharactersResponse: Codable {
    let results: [Character]
}
