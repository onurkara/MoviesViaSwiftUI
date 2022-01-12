//
//  BaseRequest.swift
//  MoviesApp
//
//  Created by Onur on 13.01.2022.
//

protocol BaseRequest: Codable {

    var baseURL: String { get }
    var path: String { get }
    var apiKey: String { get }
}


extension BaseRequest {

    var baseURL: String {
        "https://api.themoviedb.org/3/movie/\(path)?api_key=\(apiKey)&language=en-US"
    }

    var apiKey: String {
        "52c6cf767025a102f0fc5c22c7674096"
    }
}
