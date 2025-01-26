//
//  MovieService.swift
//  MovieApp
//
//  Created by Adi Andrea on 25/01/25.
//

protocol MovieServiceProtocol {
    func fetchMovies() async throws -> [Movie]
}

struct MovieService: MovieServiceProtocol {
    func fetchMovies() async throws -> [Movie] {
        try await Task.sleep(for: .seconds(2))
        return [Movie.sample]
    }
}
