//
//  CharactersDetailScreen.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation
import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300)
                .cornerRadius(10)
                .padding()

                VStack(alignment: .leading, spacing: 8) {
                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Status: \(character.status)")
                        .font(.title3)
                    
                    Text("Species: \(character.species)")
                        .font(.title3)

                    Text("Gender: \(character.gender)")
                        .font(.title3)
                                    }
                .padding([.leading, .bottom, .trailing])
            }
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

