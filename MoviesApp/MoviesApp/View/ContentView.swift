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
                    MovieView(movie: movie)
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .task {
                    await viewModel.fetchMovies()
                }.navigationTitle("Populars")
            }
            .tabItem {
                Image(systemName: "flag.fill")
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MoviesViewModel())
    }
}
