//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Onur on 15.02.2022.
//

import Foundation

@MainActor
final class MovieDetailViewModel: ObservableObject {

    @Published var detail: MovieDetail? = nil
    @Published var recommendations: [Movie] = []
    @Published var keywords: [Keyword] = []

    private let id: Int
    private let movieDetailRepository: MovieDetailRepositoryProtocol

    init(id: Int, movieDetailRepository: MovieDetailRepositoryProtocol = MovieDetailRepository()) {
        self.id = id
        self.movieDetailRepository = movieDetailRepository
    }

    func sortKeywords() -> [Keyword] {
        return keywords.sorted { $0.name < $1.name }
    }

    func fetchMovieDetailInformation() async {
        async let movieDetailResult = try? movieDetailRepository.fetchMovieDetail(id: id)
        async let recommendationsResult = try? movieDetailRepository.fetchMovieRecommendations(id: id)
        async let keywordsResult = try? movieDetailRepository.fetchMovieKeywords(id: id)

        if let movieDetailResult = await movieDetailResult {
            switch movieDetailResult {
            case .success(let detail):
                self.detail = detail
            case .failure(_):
                break
            }
        }

        if let recommendationsResult = await recommendationsResult {
            switch recommendationsResult {
            case .success(let recommendations):
                self.recommendations = recommendations
            case .failure(_):
                break
            }
        }

        if let keywordsResult = await keywordsResult {
            switch keywordsResult {
            case .success(let keywords):
                self.keywords = keywords
            case .failure(_):
                break
            }
        }
    }
}
