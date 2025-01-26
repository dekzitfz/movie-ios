//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Adi Andrea on 25/01/25.
//

import SwiftUI

@MainActor
final class MovieListViewModel: ObservableObject {
    private let service: MovieServiceProtocol
    
    @Published var movies: [Movie] = []
    @Published var errorMessage: String?
    @Published var viewState: ViewState = ViewState.loading
    
    enum ViewState {
        case loading, content, error
    }
    
    init(service: MovieServiceProtocol = MovieService()) {
        self.service = service
    }
    
    func fetchMovies() async {
        viewState = .loading
        do {
            movies = try await service.fetchMovies()
            viewState = .content
        } catch {
            errorMessage = error.localizedDescription
            viewState = .error
        }
    }
}
