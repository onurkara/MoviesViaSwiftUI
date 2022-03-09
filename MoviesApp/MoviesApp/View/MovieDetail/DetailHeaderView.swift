//
//  DetailHeaderView.swift
//  MoviesApp
//
//  Created by Onur on 8.03.2022.
//

import SwiftUI

struct DetailHeaderView: View {

    var movieDetail: MovieDetail?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(movieDetail?.title ?? "")
                .font(.system(size: 14,
                              weight: .bold,
                              design: .monospaced))
            Text(movieDetail?.overview ?? "")
                .font(.system(size: 12,
                              weight: .semibold,
                              design: .serif))
        }
        .padding(EdgeInsets(top: 5,
                            leading: 10,
                            bottom: 5,
                            trailing: 10))
    }
}
