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
    
    @Published var movies: [MovieItem] = []
    @Published var currentPage = 1
    @Published var totalPages = 1
    @Published var errorMessage: String?
    @Published var viewState: ViewState = .loading
    
    enum ViewState {
        case loading, content, error
    }
    
    init(service: MovieServiceProtocol = MovieService()) {
        self.service = service
    }
    
    func fetchMovies() async {
        guard currentPage <= totalPages else { return }
        
        //manage view state
        viewState = currentPage == 1 ? .loading : .content
        
        do {
            let (newMovies, totalPages) = try await service.fetchMovies(page: currentPage)
            self.totalPages = totalPages
            
            movies += newMovies
            viewState = .content
            currentPage += 1
        } catch {
            debugPrint(error)
            errorMessage = error.localizedDescription
            viewState = .error
        }
    }
}
