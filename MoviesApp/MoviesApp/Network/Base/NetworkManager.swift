//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Onur on 12.01.2022.
//

import Foundation

final class NetworkManager {

    static let shared = NetworkManager()
    
    private lazy var defaultSession: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    func submitRequest<T: Decodable>(request: BaseRequest) async throws -> T? {
        guard let urlPath = "\(request.baseURL)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
              let url = URL(string: urlPath) else {
                  throw BaseError.requestFailed
        }

        let urlRequest = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let response = try JSONDecoder().decode(T.self, from: data)

        return response
    }
}


