//
//  ListOfMoviesViewModel.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//

import Foundation

protocol ListOfMoviesViewModeling {
   
}

class ListOfMoviesViewModel: ListOfMoviesViewModeling, ObservableObject {
    let listOfMoviesRouter: ListOfMoviesRouting
    let repo: ListMoviesReposing
    @Published var moviesList: [Movie]?
    
    init(listOfMoviesRouter: ListOfMoviesRouting, repo: ListMoviesReposing){
        self.listOfMoviesRouter = listOfMoviesRouter
        self.repo = repo
    }
    
    func fetchMoviesList() {
        self.repo.fetchMoviesList { (result: Result<MoviesPage,Error>) in
            switch result{
            case .success(let page):
                DispatchQueue.main.async {
                    self.moviesList = page.results
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func navigateToMovieDetails(movieID: Int) {
        listOfMoviesRouter.navigateToMovieDetails(movieID: movieID)
    }
}
