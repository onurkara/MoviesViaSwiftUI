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
            DetailHeaderView(movieDetail: viewModel.detail).task {
                await viewModel.fetchMovieDetailInformation()
            }
            KeywordsView(keywords: viewModel.sortKeywords())
        }
    }
}
