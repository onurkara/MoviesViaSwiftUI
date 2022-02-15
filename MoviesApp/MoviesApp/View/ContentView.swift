//
//  ContentView.swift
//  MoviesApp
//
//  Created by Onur on 12.01.2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel: MoviesViewModel

    var body: some View {
        TabView {
            NavigationView {
                List(viewModel.popularMovies) { movie in
                    NavigationLink(destination: MovieDetailView()) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MoviesViewModel())
    }
}
