//
//  CharCellViewModel.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

@MainActor
class CharCellViewModel: ObservableObject {
    @Published var charImage: UIImage?
    @Published var isLoading = true
    let service = Service()
    let character: Character

    init(character: Character) {
        self.character = character
        Task {
            await loadImage()
        }
    }

    private func loadImage() async {
        isLoading = true
        do {
            let image = try await service.getImage(from: character.image)
            charImage = image
            isLoading = false
        } catch {
            print("Error loading image: \(error)")
        }
    }
}
