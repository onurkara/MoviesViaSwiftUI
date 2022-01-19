//
//  BaseError.swift
//  MoviesApp
//
//  Created by Onur on 13.01.2022.
//

enum BaseError: Error {

    case requestFailed

    var description: String {
        switch self {
        case .requestFailed:
            return "An error occured"
        }
    }
}
