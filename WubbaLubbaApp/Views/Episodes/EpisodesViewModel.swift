//
//  EpisodesViewModel.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

@MainActor
class EpisodesViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var isLoading = true
    let service = Service()

    func fetchEpisodes() async {
        isLoading = true

        do {
            let response = try await service.getEpisodes()
            episodes = response.results
            isLoading = false

        } catch {
            print("Error fetching episodes: \(error)")
        }
    }
}
