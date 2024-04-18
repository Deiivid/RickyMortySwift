//
//  LocationsUsecase.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation

class LocationsUsecase {
    private let service: RickyMortyService

    init(service: RickyMortyService) {
        self.service = service
    }

    func execute(completion: @escaping ([Location]?, Error?) -> Void) {
        service.getLocations(completion:completion)
    }
}
