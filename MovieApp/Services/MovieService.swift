//
//  MovieService.swift
//  MovieApp
//
//  Created by Adi Andrea on 25/01/25.
//

import Foundation
import os

protocol MovieServiceProtocol {
    func fetchSampleMovies() async throws -> [Movie]
    func fetchMovies(page: Int) async throws -> (movie: [MovieItem], totalPages: Int)
}

struct MovieService: MovieServiceProtocol {
    private let baseURL = "https://api.themoviedb.org/3"
    private let apiKey: String
    
    enum NetworkError: Error {
        case invalidURL
        case invalidResponse
        case decodingFailed
    }
    
    init() {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API Key Missing!")
        }
        self.apiKey = key
    }
    
    func fetchSampleMovies() async throws -> [Movie] {
        try await Task.sleep(for: .seconds(2))
        return [Movie.sample]
    }
    
    func fetchMovies(page: Int) async throws -> (movie: [MovieItem], totalPages: Int) {
        //create url
        guard let url = URL(string: "\(baseURL)/discover/movie?api_key=\(apiKey)&page=\(page)") else {
            throw NetworkError.invalidURL
        }
        
        //call the url to receive data & response
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        //decode json
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodeResult = try decoder.decode(ListMovieResponse.self, from: data)
        
        return (decodeResult.results, decodeResult.totalPages)
    }
}
