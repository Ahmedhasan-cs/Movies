//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Ahmed Aly on 10/07/2023.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MoviesDetailsViewModel
    var body: some View {
        ScrollView() {
            if let imageUrl = self.viewModel.movie?.poster_path {
                KFImage(URL(string: "https://image.tmdb.org/t/p/w500" + imageUrl)!)
                    .fade(duration: 0.25)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 300)
                    .padding(.bottom)
            }
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    if let title = self.viewModel.movie?.title {
                        Text(title)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                    }
                    
                    if let release_date = self.viewModel.movie?.release_date {
                        Text(release_date)
                            .font(.caption)
                            .fontWeight(.ultraLight)
                            .padding(.bottom)
                    }
                    
                    if let overview = self.viewModel.movie?.overview {
                        Text(overview)
                            .fontWeight(.light)
                            
                    }
                }.padding(10)
            }
        }
        .onAppear {
                viewModel.fetchMoviesDetails()
            }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let appRouter = AppRouter.shared
        let navigationController = appRouter.navigationController
        let router = MovieDetailsRouter(sourceController: navigationController)
        let repo = MovieDetailsRepo()
        let viewModel = MoviesDetailsViewModel(movieDetailsRouter: router, movieID: 455476, repo: repo)
        MovieDetailsView(viewModel: viewModel)
    }
}
