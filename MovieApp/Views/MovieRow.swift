//
//  MovieRow.swift
//  MovieApp
//
//  Created by Adi Andrea on 26/01/25.
//
import SwiftUI

struct MovieRow: View {
    let movie: MovieItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            //image view
            AsyncImage(url: movie.posterURL) { phase in
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
                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
