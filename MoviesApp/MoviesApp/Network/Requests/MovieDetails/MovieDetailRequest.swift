//
//  MovieDetailRequest.swift
//  MoviesApp
//
//  Created by Onur on 15.02.2022.
//

struct MovieDetailRequest: BaseRequest {

    let path: String
    let id: Int

    init(id: Int) {
        self.id = id
        self.path = String(id)
    }
}
