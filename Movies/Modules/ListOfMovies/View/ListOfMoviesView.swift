//
//  ListOfMoviesView.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//

import SwiftUI

struct ListOfMoviesView: View {
    @ObservedObject var viewModel: ListOfMoviesViewModel
    @State private var selectedMovie: Movie?
    
    var body: some View {
        List(viewModel.moviesList ?? [], id: \.title) { movie in
            MovieItemView(movie: movie)
                .onTapGesture {
                    self.selectedMovie = movie
                    self.viewModel.navigateToMovieDetails(movieID: movie.id)
                }                
        }
        .refreshable {
            viewModel.fetchMoviesList()
        }
        .listStyle(.inset)
            .onAppear {
                viewModel.fetchMoviesList()
            }
            .navigationTitle("Movies")
    }
    
}

struct ListOfMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        let appRouter = AppRouter.shared
        let navigationController = appRouter.navigationController
        let router = ListOfMoviesRouter(sourceController: navigationController)
        let repo = ListMoviesRepo()
        let viewModel = ListOfMoviesViewModel(listOfMoviesRouter: router, repo: repo)
        ListOfMoviesView(viewModel: viewModel)
    }
}
