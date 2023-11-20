//
//  CharactersViewModel.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

@MainActor
class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading  = true
    let service = Service()

    func fetchCharacters() async {
        isLoading = true

        do {
            let response = try await service.getCharacters()
            characters = response.results
            isLoading = false
        } catch {
            print("Error fetching characters: \(error)")
        }
    }
}
