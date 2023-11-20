//
//  ContentView.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

enum Tab: String {
    case characters = "characters"
    case episodes = "episodes"
}

struct MainView: View {

    @State private var selectedTab: Tab = .characters


    var body: some View {
        Group {

            TabView(selection: $selectedTab) {
                Characters()
                    .tabItem {
                        Label("Characters", systemImage: "person.and.background.dotted")
                    }
                    .tag(Tab.characters)

                Episodes()
                    .tabItem {
                        Label("Episodes", systemImage: "list.and.film")
                    }
                    .tag(Tab.episodes)
            }
        }
        .accentColor(.green)
    }
}


#Preview {
    MainView()
}
