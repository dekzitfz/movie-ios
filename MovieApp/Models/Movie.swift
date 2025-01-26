//
//  Movie.swift
//  MovieApp
//
//  Created by Adi Andrea on 25/01/25.
//

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let genre: Genre
    let imageUrl: String
    
}

extension Movie {
    static let sample = Movie(
        id: 1,
        title: "The Dark Knight",
        genre: Genre.action,
        imageUrl: "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg"
    )
}
