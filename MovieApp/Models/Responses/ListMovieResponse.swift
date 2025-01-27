//
//  ListMovieResponse.swift
//  MovieApp
//
//  Created by Adi Andrea on 27/01/25.
//

import Foundation

struct ListMovieResponse: Codable {
    let page: Int
    let results: [MovieItem]
    let totalPages, totalResults: Int
}

struct MovieItem: Codable, Identifiable, Equatable {
    let backdropPath: String
    let id: Int
    let overview, posterPath, releaseDate, title: String
    
    var posterURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
    }
}
