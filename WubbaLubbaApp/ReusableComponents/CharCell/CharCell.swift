//
//  CharCell.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

struct CharCell: View {
    @ObservedObject private var viewModel: CharCellViewModel

    init(viewModel: CharCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack (spacing: 20) {

            if viewModel.isLoading {
               
                ProgressView()

            } else {

                if let charImage = viewModel.charImage {
                    Image(uiImage: charImage)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                }
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.character.name)
                    .font(.headline)

                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Status: \(viewModel.character.status.rawValue)")
                        Text("Species: \(viewModel.character.species)")
                        Text("Gender: \(viewModel.character.gender.rawValue)")
                    }
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CharCell(viewModel: CharCellViewModel(
        character: Character(
            id: 1,
            name: "Rick Sanchez",
            status: .alive,
            species: "Human",
            type: "",
            gender: .male,
            origin: Origin(name: "Earth (C-137)", url: ""),
            location: SingleLocation(name: "Citadel of Ricks", url: ""),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: [ ],
            url: "",
            created: ""
        )
    ))
}
