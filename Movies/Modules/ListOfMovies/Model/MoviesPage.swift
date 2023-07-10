//
//  MoviesPage.swift
//  Movies
//
//  Created by Ahmed Aly on 10/07/2023.
//

import Foundation

struct MoviesPage: Codable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
