//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Onur on 15.02.2022.
//

import SwiftUI

struct MovieDetailView: View {

    @StateObject var viewModel: MovieDetailViewModel

    var body: some View {
        VStack {
            ScrollView {
                DetailHeaderView(movieDetail: viewModel.detail).task {
                    await viewModel.fetchMovieDetailInformation()
                }
                if !viewModel.sortKeywords().isEmpty {
                    KeywordsView(keywords: viewModel.sortKeywords())
                }
                if !viewModel.recommendations.isEmpty {
                    HeaderView(headerText: "Recommendations")
                    ScrollView(.horizontal, showsIndicators: false) {
                        RecommendationView(recommendations: viewModel.recommendations)
                    }
                }
            }
        }
    }
}
