//
//  Characters.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

struct Characters: View {
    @StateObject private var viewModel = CharactersViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
        
                    ProgressView()

                } else {
                    List(viewModel.characters, id: \.id) { character in
                        CharCell(viewModel: CharCellViewModel(character: character))
                    }
                }
            }
            .navigationBarTitle("Characters")
        }
        .task {
            await viewModel.fetchCharacters()
        }
    }
}

#Preview {
    Characters()
}
