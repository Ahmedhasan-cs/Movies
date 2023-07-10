//
//  ListOfMoviesRouter.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//

import Foundation
import UIKit
import SwiftUI

protocol ListOfMoviesRouting {
    func navigateToMovieDetails(movieID: Int)
}

struct ListOfMoviesRouter: ListOfMoviesRouting {
    var sourceController: UINavigationController
    
    func navigateToMovieDetails(movieID: Int) {
        MovieDetailsLauncher(sourceController: sourceController).launch(movieID: movieID)
    }
}
