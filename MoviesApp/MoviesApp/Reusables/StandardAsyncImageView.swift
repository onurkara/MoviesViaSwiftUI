//
//  StandardAsyncImageView.swift
//  MoviesApp
//
//  Created by Onur on 27.01.2022.
//

import SwiftUI

struct StandardAsyncImageView: View {

    var height: CGFloat
    var imagePath: String

    var body: some View {
        AsyncImage(url: URL(string: imagePath)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: height, alignment: .top)
            case .failure:
                EmptyView()
            @unknown default:
                EmptyView()
            }
        }.cornerRadius(6)
    }
}
