//
//  EpisodesResponse.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation

struct Episode: Codable, Identifiable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
}

struct EpisodesResponse: Codable {
    let results: [Episode]
}
