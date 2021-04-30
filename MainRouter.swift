//
//  MainRouter.swift
//

import UIKit

protocol Router: class {
    func start()
}

class MainRouter: Router {
    
    let window: UIWindow
    var navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
       
        // Change with your initial view controller
        // let loginView = LoginRouter.createModule()
        // navigationController = UINavigationController(rootViewController: loginView)
 
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
