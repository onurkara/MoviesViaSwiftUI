//
//  MovieDetailRepository.swift
//  MoviesApp
//
//  Created by Onur on 15.02.2022.
//

protocol MovieDetailRepositoryProtocol {

    func fetchMovieDetail(id: Int) async throws -> Result<MovieDetail, BaseError>
    func fetchMovieKeywords(id: Int) async throws -> Result<[Keyword], BaseError>
    func fetchMovieRecommendations(id: Int) async throws -> Result<[Movie], BaseError>
}

final class MovieDetailRepository: MovieDetailRepositoryProtocol {

    func fetchMovieDetail(id: Int) async throws -> Result<MovieDetail, BaseError> {
        do {
            let movieDetailResponse: MovieDetail? = try await NetworkManager.shared.submitRequest(request: MovieDetailRequest(id: id))
            guard let movieDetail = movieDetailResponse else {
                return .failure(.requestFailed)
            }
            return .success(movieDetail)
        } catch {
            return .failure(.requestFailed)
        }
    }

    func fetchMovieKeywords(id: Int) async throws -> Result<[Keyword], BaseError> {
        do {
            let movieKeywordsResponse: MovieKeywordsResponse? = try await NetworkManager.shared.submitRequest(request: MovieKeywordsRequest(id: id))
            return .success(movieKeywordsResponse?.keywords ?? [])
        } catch {
            return .failure(.requestFailed)
        }
    }

    func fetchMovieRecommendations(id: Int) async throws -> Result<[Movie], BaseError> {
        do {
            let movieRecommendationResponse: MovieRecommendationResponse? = try await NetworkManager.shared.submitRequest(request: MovieRecommendationRequest(id: id))
            return .success(movieRecommendationResponse?.results ?? [])
        } catch {
            return .failure(.requestFailed)
        }
    }
}
