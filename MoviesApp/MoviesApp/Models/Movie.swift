//
//  Movie.swift
//  MoviesApp
//
//  Created by Onur on 16.01.2022.
//

struct Movie: Codable {

    let id: Int?
    let title: String?
    let overview: String?
    let poster_path: String?
    let voteAverage: Double?
}

extension Movie: Identifiable {

    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}
