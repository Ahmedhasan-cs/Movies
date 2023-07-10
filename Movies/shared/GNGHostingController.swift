//
//  GNGHostingController.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//

import Foundation
import SwiftUI

class GNGHostingController {
    static func gngHostingContoller<Content: View>(rootView: Content, backgroundColor: UIColor? = UIColor.white, hideNavigationBar: Bool = true, statusBarStyle: UIStatusBarStyle = .default) -> HostingController<some View>{
        let content = rootView
            .environment(\.layoutDirection, getLayoutDiraction())
        let controller = HostingController(rootView: content, statusBarStyle: statusBarStyle)
        controller.view?.backgroundColor = backgroundColor
        controller.navigationItem.hidesBackButton = hideNavigationBar
        return controller
    }
    
    static func getLayoutDiraction() -> LayoutDirection {
        return .leftToRight
    }
}

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView : View {
    var statusBarStyle : UIStatusBarStyle = .default
    convenience init(rootView: ContentView, statusBarStyle: UIStatusBarStyle = .lightContent) {
        self.init(rootView: rootView)
        self.statusBarStyle = statusBarStyle
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
}
