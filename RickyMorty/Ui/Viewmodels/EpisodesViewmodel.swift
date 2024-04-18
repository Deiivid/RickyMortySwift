//
//  EpisodesViewmodel.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation
import SwiftUI
import Combine

class EpisodesViewModel: ObservableObject {
        @Published var episodes: [Episode] = []
        @Published var isLoading = false
        @Published var errorMessage: String?

            private let getEpisodesUsecase: EpisodesUsecase
            private var cancellables = Set<AnyCancellable>()

            init(getEpisodesUsecase: EpisodesUsecase) {
                self.getEpisodesUsecase = getEpisodesUsecase
            }

            func loadEpisodes() {
                isLoading = true
                getEpisodesUsecase.execute { [weak self] (episodes, error) in
                    DispatchQueue.main.async {
                        self?.isLoading = false
                        if let episodes = episodes {
                            self?.episodes = episodes
                        } else if let error = error {
                            self?.errorMessage = error.localizedDescription
                        }
                    }
                }
            }
        }
