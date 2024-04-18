//
//  CharacterViewModel.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let getCharactersUseCase: CharactersUsecase
    private var cancellables = Set<AnyCancellable>()

    init(getCharactersUseCase: CharactersUsecase) {
        self.getCharactersUseCase = getCharactersUseCase
    }

    func loadCharacters() {
        isLoading = true
        getCharactersUseCase.execute { [weak self] (characters, error) in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let characters = characters {
                    self?.characters = characters
                } else if let error = error {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
}
