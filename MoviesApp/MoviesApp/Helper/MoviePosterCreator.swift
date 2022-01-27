//
//  MoviePosterCreator.swift
//  MoviesApp
//
//  Created by Onur on 27.01.2022.
//

enum MoviePosterCreator {

    private static let posterPathBase = "https://image.tmdb.org/t/p/w342"

    static func createPoster(posterPath: String) -> String {
        posterPathBase + posterPath
    }
}
