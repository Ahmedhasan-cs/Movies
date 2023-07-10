//
//  MovieDetailsRepo.swift
//  Movies
//
//  Created by Ahmed Aly on 10/07/2023.
//

import Foundation

protocol MovieDetailsReposing {
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie, Error>) -> Void)
}

class MovieDetailsRepo: MovieDetailsReposing {
    let apiService: APIService
    init(apiService: APIService = NetworkManager()) {
        self.apiService = apiService
    }
    
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        self.apiService.executeQuery(service: .movie(movieID), data: nil, method: APIMethod.GET ) { (result: Result<Movie, Error>) in
            completion(result)
        }
    }
}
