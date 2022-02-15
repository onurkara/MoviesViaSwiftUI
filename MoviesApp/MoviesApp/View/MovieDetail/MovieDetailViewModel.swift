//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Onur on 15.02.2022.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {

    private let id: Int

    init(id: Int) {
        self.id = id
    }
}
