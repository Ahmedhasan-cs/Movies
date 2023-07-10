//
//  MovieDetailsLauncher.swift
//  Movies
//
//  Created by Ahmed Aly on 10/07/2023.
//

import Foundation
import UIKit
import SwiftUI

protocol MovieDetailsLaunching {
    func launch(movieID: Int)
}

struct MovieDetailsLauncher: MovieDetailsLaunching {
    let sourceController: UINavigationController
    
    func launch(movieID: Int) {
        let router = MovieDetailsRouter(sourceController: sourceController)
        let repo = MovieDetailsRepo()
        let viewModel = MoviesDetailsViewModel(movieDetailsRouter: router, movieID: movieID, repo: repo)
        let movieDetailsView = MovieDetailsView(viewModel: viewModel)
        let controller = GNGHostingController.gngHostingContoller(rootView: movieDetailsView)
        sourceController.pushViewController(controller, animated: true)
    }
}

