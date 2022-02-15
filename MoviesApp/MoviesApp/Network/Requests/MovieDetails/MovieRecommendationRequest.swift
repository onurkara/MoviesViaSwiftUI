//
//  MovieRecommendationRequest.swift
//  MoviesApp
//
//  Created by Onur on 15.02.2022.
//

struct MovieRecommendationRequest: BaseRequest {

    let id: Int
    let path: String

    init(id: Int) {
        self.id = id
        self.path = String(id) + "/recommendations"
    }
}
