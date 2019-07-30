//
//  CastRow.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 09/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct MovieCrosslinePeopleRow : View {
    let title: String
    let peoples: [People]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .titleStyle()
                .padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.peoples) { cast in
                        PeopleRowItem(people: cast)
                    }
                }.padding(.leading)
            }
        }.listRowInsets(EdgeInsets())
            .padding(.top)
            .padding(.bottom)
    }
}

struct PeopleRowItem: View {
    let people: People
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(destination: PeopleDetail(peopleId: people.id).environmentObject(store)) {
                PeopleImage(imageLoader: ImageLoaderCache.shared.loaderFor(path: people.profile_path,
                                                                           size: .cast))
                Text(people.name).font(.body).foregroundColor(.primary)
                Text(people.character ?? people.department ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }.frame(width: 100)
            }
    }
}

#if DEBUG
struct CastsRow_Previews : PreviewProvider {
    static var previews: some View {
        MovieCrosslinePeopleRow(title: "Sample", peoples: sampleCasts)
    }
}
#endif
