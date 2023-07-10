//
//  ListMoviesRepo.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//

import Foundation

protocol ListMoviesReposing {
    func fetchMoviesList(completion: @escaping (Result<MoviesPage, Error>) -> Void)
}

class ListMoviesRepo: ListMoviesReposing {
    let apiService: APIService
    init(apiService: APIService = NetworkManager()) {
        self.apiService = apiService
    }
    
    func fetchMoviesList(completion: @escaping (Result<MoviesPage, Error>) -> Void) {
        self.apiService.executeQuery(service: .moviesList, data: nil, method: APIMethod.GET ) { (result: Result<MoviesPage, Error>) in
            completion(result)
        }
    }
}
