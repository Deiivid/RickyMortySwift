//
//  EpisodesScreen.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject var viewModel = EpisodesViewModel(getEpisodesUsecase: EpisodesUsecase(service: RickyMortyService()))
    @State private var selectedEpisode: Episode?

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.episodes) { episode in
                        EpisodeCell(episode: episode) {
                            selectedEpisode = episode
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Episodes")
            .onAppear {
                viewModel.loadEpisodes()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Cargando...")
                }
            }
            .sheet(item: $selectedEpisode) { episode in
                EpisodeDetailView(episode: episode)
            }
        }
    }
}

struct EpisodeCell: View {
    let episode: Episode
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(episode.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Aired: \(episode.air_date)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Code: \(episode.episode)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
            }
            .frame(width: 160, height: 200)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
            .padding(.horizontal)
            .padding(.top, 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}



#Preview {
    EpisodesView()
}
