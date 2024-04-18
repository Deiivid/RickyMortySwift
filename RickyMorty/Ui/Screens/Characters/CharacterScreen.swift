//
//  CharacterScreen.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import Foundation

import SwiftUI

struct CharactersView: View {
    @StateObject var viewModel = CharactersViewModel(getCharactersUseCase: CharactersUsecase(service: RickyMortyService()))

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                CharacterRow(character: character)
            }
            .navigationTitle("Characters")
            .onAppear {
                viewModel.loadCharacters()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Cargando...")
                }
            }
        }
    }
}

struct CharacterRow: View {
    let character: Character
    
    var body: some View {
        HStack {
            NavigationLink(destination: CharacterDetailView(character: character)) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .cornerRadius(40)
                
                VStack(alignment: .leading) {
                    
                    Text(character.name)
                        .font(.headline)
                    
                    HStack {
                        
                        Text(character.status)
                            .font(.subheadline)
                            .foregroundColor(character.status == "Alive" ? .green : .red)
                        Spacer()
                        
                        Text(character.species)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .shadow(radius: 5)
            .padding([.top, .horizontal])
        }
    }}

#Preview {
    CharactersView()
}
