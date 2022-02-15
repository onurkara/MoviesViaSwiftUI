//
//  MovieKeywordsRequest.swift
//  MoviesApp
//
//  Created by Onur on 15.02.2022.
//

struct MovieKeywordsRequest: BaseRequest {

    let path: String
    let id: Int

    init(id: Int) {
        self.id = id
        self.path = String(id) + "/keywords"
    }
}
