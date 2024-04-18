//
//  CharactersUsecase.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation


class CharactersUsecase {
    private let service: RickyMortyService

    init(service: RickyMortyService) {
        self.service = service
    }

    func execute(completion: @escaping ([Character]?, Error?) -> Void) {
        service.getCharacters(completion: completion)
    }
}
