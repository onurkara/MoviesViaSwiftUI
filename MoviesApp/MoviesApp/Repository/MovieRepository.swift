//
//  MovieRepository.swift
//  MoviesApp
//
//  Created by Onur on 16.01.2022.
//

protocol MovieRepositoryProtocol {

    func fetchPopularMovies() async throws -> Result<[Movie], BaseError>
}

final class MovieRepository: MovieRepositoryProtocol {

    func fetchPopularMovies() async throws -> Result<[Movie], BaseError> {
        do {
            let popularMoviesResponse: MovieResponse? = try await NetworkManager.shared.submitRequest(request: PopularMoviesRequest())
            return .success(popularMoviesResponse?.results ?? [])
        } catch {
            return .failure(.requestFailed)
        }
    }
}
