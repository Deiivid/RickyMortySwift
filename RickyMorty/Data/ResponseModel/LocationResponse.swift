//
//  LocationResponse.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation
struct Location: Codable, Identifiable {
    let id: Int
     let name: String
     let type: String
     let dimension: String
     let residents: [String]
     let created: String
}

struct LocationsResponse: Codable {
    let results: [Location]
}
