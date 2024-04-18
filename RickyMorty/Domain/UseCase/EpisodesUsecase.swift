//
//  EpisodesUsecase.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation
class EpisodesUsecase {
    private let service: RickyMortyService

    init(service: RickyMortyService) {
        self.service = service
    }

    func execute(completion: @escaping ([Episode]?, Error?) -> Void) {
        service.getEpisodes(completion:completion)
    }
}
