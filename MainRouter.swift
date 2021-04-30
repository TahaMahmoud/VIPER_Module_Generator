//
//  MainRouter.swift
//

import UIKit

protocol Router: class {
    func start()
    func route(to router: Router)
}

extension Router {
    func route(to router: Router) {
        router.start()
    }
}


class MainRouter: Router {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        var navigationController = UINavigationController()
        if #available(iOS 13.0, *) {
            navigationController.overrideUserInterfaceStyle = .light
        }
//        Change with your initial view controller
//        let loginView = LoginRouter.createModule()
//        navigationController = UINavigationController(rootViewController: loginView)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
 
    }
}
