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
        VStack(spacing: 4.0) {
            HStack {
                StandardAsyncImageView(imagePath: MoviePosterCreator.createPoster(posterPath: movie.poster_path ?? ""))
                    .frame(height: 70, alignment: .top)
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title ?? "")
                        .font(.system(size: 14,
                                      weight: .bold,
                                      design: .monospaced))
                        .frame(alignment: .leading)
                        .lineLimit(2)
                        .fixedSize(horizontal: false,
                                   vertical: true)
                    Text(movie.overview ?? "")
                        .font(.system(size: 12,
                                      weight: .semibold,
                                      design: .serif))
                        .lineLimit(2)
                        .fixedSize(horizontal: false,
                                   vertical: true)
                    Spacer()
                }
                Spacer()
            }
            SeparatorView()
        }.frame(height: 74)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: Movie(id: 1,
                               title: "Temp movie title",
                               overview: "Temp overview",
                               poster_path: "Image path",
                               voteAverage: 5.5))
    }
}
