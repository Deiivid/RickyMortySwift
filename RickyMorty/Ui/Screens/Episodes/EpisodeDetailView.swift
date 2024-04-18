//
//  EpisodeDetailView.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//
import Foundation

import SwiftUI
struct EpisodeDetailView: View {
    let episode: Episode
    @State private var characters: [Character] = []
    private let rickyMortyService = RickyMortyService()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(episode.name)
                    .font(.largeTitle)
                Text("Episode: \(episode.episode)")
                    .font(.title2)
                Text("Aired on: \(episode.air_date)")
                    .font(.title3)
                
                Divider()

                Text("Characters:")
                    .font(.headline)
                ForEach(characters, id: \.id) { character in
                    Text(character.name)
                        .padding(.leading, 10)
                }
            }
            .padding()
        }

        
    }


}
