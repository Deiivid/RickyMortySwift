//
//  LocationDetailSheet.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//
import Foundation

import SwiftUI

struct LocationDetailSheet: View {
    let location: Location
    @State private var characters: [Character] = []
    private let characterService = CharacterService()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(location.name)
                    .font(.largeTitle)
                    .padding()

                Group {
                    Text("Type: \(location.type)")
                        .font(.title2)
                        .padding()

                    Text("Dimension: \(location.dimension)")
                        .font(.title3)
                        .padding()

                    Text("Created on: \(location.created)")
                        .font(.caption)
                        .padding()
                }

                if !location.residents.isEmpty {
                    Text("Habitants:")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(characters) { character in
                                VStack {
                                    AsyncImage(url: URL(string: character.image)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray.frame(width: 100, height: 100)
                                    }
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())

                                    Text(character.name)
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.leading, 8)
                    }
                    .frame(height: 150)
                }

                Spacer()
            }
            .onAppear {
                loadCharacters()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
        }
    }

    func loadCharacters() {
        location.residents.forEach { url in
            characterService.fetchCharacter(from: url) { character in
                if let character = character {
                    DispatchQueue.main.async {
                        self.characters.append(character)
                    }
                }
            }
        }
    }
}

