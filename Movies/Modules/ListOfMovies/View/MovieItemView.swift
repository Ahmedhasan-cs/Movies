//
//  Item.swift
//  DemoApp
//
//  Created by Ahmed Aly on 03/06/2023.
//

import SwiftUI
import Kingfisher

struct MovieItemView: View {
    var movie: Movie
    var body: some View {
        HStack {
            if let imageUrl = self.movie.poster_path {
                KFImage(URL(string: "https://image.tmdb.org/t/p/w200" + imageUrl)!)
                    .fade(duration: 0.25)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 200)
            }
            VStack(alignment: .leading) {
                Text(movie.title)
                    .fontWeight(.heavy)
                Text(movie.release_date)
            }
            
        }
    }
}

struct Item_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(movie: Movie(adult: false, backdrop_path: "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg", id: 455476, original_title: "Knights of the Zodiac", overview: "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?", poster_path: "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg", release_date: "2023-04-27", title: "Knights of the Zodiac"))
    }
}
