//
//  Service.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

enum APIEndpoint: String {
    case episodes = "https://rickandmortyapi.com/api/episode"
    case characters = "https://rickandmortyapi.com/api/character"
}

enum ServiceError: Error {
    case invalidURL
    case networkError
    case decodingError
}

class Service {
    
    func getEpisodes() async throws -> EpisodeResponse {
        let endpoint = APIEndpoint.episodes.rawValue
        return try await performRequest(endpoint: endpoint)
    }

    func getCharacters() async throws -> CharacterResponse {
        let endpoint = APIEndpoint.characters.rawValue
        return try await performRequest(endpoint: endpoint)
    }

    func performRequest<T: Codable>(endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw ServiceError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw ServiceError.networkError
        }
    }

    func getImage(from urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            throw ServiceError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                return image
            } else {
                throw ServiceError.decodingError
            }
        } catch {
            throw ServiceError.networkError
        }
    }
}
