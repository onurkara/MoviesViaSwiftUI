//
//  HeaderView.swift
//  MoviesApp
//
//  Created by Onur on 9.03.2022.
//

import SwiftUI

struct HeaderView: View {

    let headerText: String

    var body: some View {
        Text(headerText)
            .font(.title3)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .padding(EdgeInsets(top: 5,
                                leading: 10,
                                bottom: 5,
                                trailing: 5))
            .background(Color.gray)
    }
}
