//
//  MovieListView.swift
//  MovieApp
//
//  Created by Adi Andrea on 25/01/25.
//
import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.viewState {
                case .loading:
                    ProgressView("Loading...")
                case .content:
                    List(viewModel.movies) { movie in
                        MovieRow(movie: movie)
                    }
                    .listStyle(.plain)
                case .error:
                    ErrorView(
                        message: viewModel.errorMessage ?? "Unknown error",
                        action: {
                            Task {
                                await viewModel.fetchMovies()
                            }
                        }
                    )
                }
            }
            .navigationTitle("Movies")
            .task {
                await viewModel.fetchMovies()
            }
        }
    }
}
