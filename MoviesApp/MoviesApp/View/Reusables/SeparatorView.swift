//
//  SeparatorView.swift
//  MoviesApp
//
//  Created by Onur on 23.01.2022.
//

import SwiftUI

struct SeparatorView: View {

    var color: Color = .gray
    var insets: EdgeInsets = EdgeInsets()

    var body: some View {
        Divider()
            .background(color)
            .padding(insets)
    }
}
