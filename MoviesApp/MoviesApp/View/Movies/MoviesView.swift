//
//  MoviesView.swift
//  MoviesApp
//
//  Created by Onur on 12.01.2022.
//

import SwiftUI

struct MoviesView: View {

    @StateObject var viewModel: MoviesViewModel

    var body: some View {
        TabView {
            NavigationView {
                List(viewModel.popularMovies) { movie in
                    NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(id: movie.id ?? 0))) {
                        MovieView(movie: movie)
                    }.listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Populars")
            }
            .tabItem {
                Text("Populars")
                Image(systemName: "flag.fill")
            }
            NavigationView {
                List(viewModel.topRatedMovies) { movie in
                    MovieView(movie: movie)
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Top Rated")
            }
            .tabItem {
                Text("Latests")
                Image(systemName: "star.fill")
            }
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(viewModel: MoviesViewModel())
    }
}
