//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Onur on 16.01.2022.
//

import Foundation

@MainActor
final class MoviesViewModel: ObservableObject {

    @Published var movies: [Movie] = []
    @Published var message: String = ""

    private let movieRepository: MovieRepositoryProtocol

    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        self.movieRepository = movieRepository
    }

    func fetchMovies() async {
        guard let result = try? await movieRepository.fetchPopularMovies() else {
            return
        }
        switch result {
        case .success(let movies):
            self.movies = movies
        case .failure(let error):
            self.message = error.description
        }
    }
}
