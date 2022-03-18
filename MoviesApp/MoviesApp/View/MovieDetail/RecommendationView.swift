//
//  RecommendationView.swift
//  MoviesApp
//
//  Created by Onur on 18.03.2022.
//

import SwiftUI

struct RecommendationView: View {

    var recommendations: [Movie]

    var body: some View {
        LazyHGrid(rows: [GridItem(.adaptive(minimum: 80))],
                  spacing: 20) {
            Section() {
                ForEach(recommendations, id: \.self) { recommendation in
                    StandardAsyncImageView(height: 140,
                                           imagePath: MoviePosterCreator.createPoster(posterPath: recommendation.poster_path ?? ""))
                }
            }
        }.padding(EdgeInsets(top: 10,
                             leading: 10,
                             bottom: 10,
                             trailing: 10))
    }
}
