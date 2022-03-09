//
//  KeywordsView.swift
//  MoviesApp
//
//  Created by Onur on 9.03.2022.
//

import SwiftUI

struct KeywordsView: View {

    var keywords: [Keyword]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                      spacing: 5,
                      pinnedViews: [.sectionHeaders]) {
                Section(header: HeaderView(headerText: "Keywords")) {
                    ForEach(keywords, id: \.self) { keyword in
                        Text(keyword.name)
                            .foregroundColor(Color.white)
                            .padding()
                            .lineLimit(1)
                            .font(.system(size: 12))
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}
