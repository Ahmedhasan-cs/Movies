//
//  MoviesDetailsViewModel.swift
//  Movies
//
//  Created by Ahmed Aly on 10/07/2023.
//

import Foundation

protocol MoviesDetailsViewModeling {
   
}

class MoviesDetailsViewModel: MoviesDetailsViewModeling, ObservableObject {
    let movieDetailsRouter: MovieDetailsRouting
    let repo: MovieDetailsReposing
    let movieID: Int
    @Published var movie: Movie?
    
    init(movieDetailsRouter: MovieDetailsRouting, movieID: Int, repo: MovieDetailsReposing){
        self.movieDetailsRouter = movieDetailsRouter
        self.movieID = movieID
        self.repo = repo
    }
    
    func fetchMoviesDetails() {
        self.repo.fetchMovieDetails(movieID: movieID) { (result: Result<Movie,Error>) in
            switch result{
            case .success(let movie):
                DispatchQueue.main.async {
                    self.movie = movie
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

