//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Onur on 16.01.2022.
//

import Foundation

@MainActor
final class MoviesViewModel: ObservableObject {

    @Published var popularMovies: [Movie] = []
    @Published var latestMovies: [Movie] = []
    @Published var message: String = ""

    private let movieRepository: MovieRepositoryProtocol

    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        self.movieRepository = movieRepository
    }

    func fetchMovies() async {
        async let popularMoviesResponse = try? movieRepository.fetchPopularMovies()
        async let latestsMoviesResponse = try? movieRepository.fetchLatestMovies()

        if let popularResult = await popularMoviesResponse {
            switch popularResult {
            case .failure(let error):
                self.message = error.description
                return
            case .success(let movies):
                self.popularMovies = movies
            }
        }

        if let latestResult = await latestsMoviesResponse {
            switch latestResult {
            case .failure(let error):
                self.message = error.description
                return
            case .success(let movies):
                self.latestMovies = movies
            }
        }
    }
}
