//
//  LocationsViewModel.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation
import Combine

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

        private let getLocationsUsecase: LocationsUsecase
        private var cancellables = Set<AnyCancellable>()

        init(getLocationsUsecase: LocationsUsecase) {
            self.getLocationsUsecase = getLocationsUsecase
        }

        func loadLocations() {
            isLoading = true
            getLocationsUsecase.execute { [weak self] (locations, error) in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let locations = locations {
                        self?.locations = locations
                    } else if let error = error {
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    }
