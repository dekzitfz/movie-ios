//
//  MovieRow.swift
//  MovieApp
//
//  Created by Adi Andrea on 26/01/25.
//
import SwiftUI

struct MovieRow: View {
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            //image view
            AsyncImage(url: URL(string: movie.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable().aspectRatio(contentMode: .fill)
                case .failure:
                    Image(systemName: "film")
                @unknown default: EmptyView()
                }
            }
            .frame(width: 100, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            //title & genre
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.genre.rawValue)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
