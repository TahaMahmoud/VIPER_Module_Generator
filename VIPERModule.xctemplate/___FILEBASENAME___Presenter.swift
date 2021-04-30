//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: ___VARIABLE_productName:identifier___ Presenter -

class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___PresenterProtocol, ___VARIABLE_productName:identifier___InteractorOutputProtocol {

    weak var view: ___VARIABLE_productName:identifier___ViewProtocol?
    private let interactor: ___VARIABLE_productName:identifier___InteractorInputProtocol
    private let router: ___VARIABLE_productName:identifier___RouterProtocol
    
    init(view: ___VARIABLE_productName:identifier___ViewProtocol, interactor: ___VARIABLE_productName:identifier___InteractorInputProtocol, router: ___VARIABLE_productName:identifier___RouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        
    }
    
}
