//
//  Movie.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//

import Foundation

struct Movie: Codable, Equatable {
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let original_title: String
    let overview: String
    let poster_path: String
    let release_date: String
    let title: String
}
