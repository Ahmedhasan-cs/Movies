//
//  ListOfMoviesLanucher.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//

import Foundation
import UIKit
import SwiftUI

protocol ListOfMoviesLaunching {
    func launch()
}

struct ListOfMoviesLauncher: ListOfMoviesLaunching {
    let sourceController: UINavigationController
    
    func launch() {
        let router = ListOfMoviesRouter(sourceController: sourceController)
        let repo = ListMoviesRepo()
        let viewModel = ListOfMoviesViewModel(listOfMoviesRouter: router, repo: repo)
        let listOfMoviesView = ListOfMoviesView(viewModel: viewModel)
        let controller = GNGHostingController.gngHostingContoller(rootView: listOfMoviesView)
        sourceController.pushViewController(controller, animated: true)
    }
}
