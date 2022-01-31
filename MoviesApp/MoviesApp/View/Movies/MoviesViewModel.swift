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
    @Published var topRatedMovies: [Movie] = []
    @Published var message: String = ""

    private let movieRepository: MovieRepositoryProtocol

    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        self.movieRepository = movieRepository
    }

    func fetchMovies() async {
        async let popularMoviesResponse = try? movieRepository.fetchPopularMovies()
        async let topRatedMoviesResponse = try? movieRepository.fetchTopRatedMovies()

        if let popularResult = await popularMoviesResponse {
            switch popularResult {
            case .failure(let error):
                self.message = error.description
                return
            case .success(let movies):
                self.popularMovies = movies
            }
        }

        if let topRatedResult = await topRatedMoviesResponse {
            switch topRatedResult {
            case .failure(let error):
                self.message = error.description
                return
            case .success(let movies):
                self.topRatedMovies = movies
                print("a")
            }
        }
    }
}
