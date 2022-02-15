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
        Text("Movie Detail View will be implemented").task {
            await viewModel.fetchMovieDetailInformation()
        }
    }
}
