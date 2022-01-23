//
//  MovieView.swift
//  MoviesApp
//
//  Created by Onur on 23.01.2022.
//

import SwiftUI

struct MovieView: View {

    var movie: Movie

    var body: some View {
        VStack(alignment: .leading,
               spacing: 4.0) {
            Text(movie.title ?? "")
            Text(movie.overview ?? "")
            SeparatorView()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: Movie(id: 1,
                               title: "Temp movie title",
                               overview: "Temp overview",
                               posterPath: "Image path",
                               voteAverage: 5.5))
    }
}
