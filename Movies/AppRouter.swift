//
//  AppRouter.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//

import Foundation
import UIKit

protocol AppRouting {
    var navigationController: UINavigationController { get }
}

struct AppRouter: AppRouting {
    var navigationController: UINavigationController
    
    static var shared: AppRouter = AppRouter()
    
    init () {
        navigationController = UINavigationController()
    }
}
