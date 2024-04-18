//
//  LocationsScreen.swift
//  RickyMorty
//
//  Created by David Navarro Moreno on 18/4/24.
//
import Foundation

import SwiftUI


struct LocationsView: View {
    @StateObject var viewModel = LocationsViewModel(getLocationsUsecase: LocationsUsecase(service: RickyMortyService()))
    @State private var showingDetail = false
    @State private var selectedLocation: Location?

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.locations) { location in
                        LocationCell(location: location) {
                            selectedLocation = location
                            showingDetail = true
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Locations")
            .onAppear {
                viewModel.loadLocations()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Cargando...")
                }
            }
            .sheet(isPresented: $showingDetail) {
                if let location = selectedLocation {
                    LocationDetailSheet(location: location)
                }
            }
        }
    }
}

    
    
    struct LocationCell: View {
        let location: Location
        var onTap: () -> Void

        var body: some View {
            Button(action: onTap) {
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 70, height: 70)
                            .shadow(radius: 3)
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 10)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(location.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("Type: \(location.type)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Dimension: \(location.dimension)")
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
    LocationsView()
}
