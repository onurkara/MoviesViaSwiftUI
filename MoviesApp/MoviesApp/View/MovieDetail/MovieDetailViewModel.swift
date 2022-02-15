//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Onur on 15.02.2022.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {

    private let id: Int
    private let movieDetailRepository: MovieDetailRepositoryProtocol

    init(id: Int, movieDetailRepository: MovieDetailRepositoryProtocol = MovieDetailRepository()) {
        self.id = id
        self.movieDetailRepository = movieDetailRepository
    }

    func fetchMovieDetailInformation() async {
        //TODO: Will be implemented
    }
}
