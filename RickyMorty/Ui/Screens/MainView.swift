//
//  MainView.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Personajes", systemImage: "person.3.fill")
                }

            LocationsView()
                .tabItem {
                    Label("Localizaciones", systemImage: "map.fill")
                }
            
            EpisodesView()
                           .tabItem {
                               Label("Episodios", systemImage: "tv.fill")
                           }

        }
    }
}
#Preview {
    MainView()
}
