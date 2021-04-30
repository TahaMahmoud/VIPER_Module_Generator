//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: ___VARIABLE_productName:identifier___ Protocols

protocol ___VARIABLE_productName:identifier___ViewProtocol: class {
    var presenter: ___VARIABLE_productName:identifier___PresenterProtocol! { get set }
    
}

protocol ___VARIABLE_productName:identifier___PresenterProtocol: class {
    var view: ___VARIABLE_productName:identifier___ViewProtocol? { get set }
    
    func viewDidLoad()

}

protocol ___VARIABLE_productName:identifier___RouterProtocol {
    
}

protocol ___VARIABLE_productName:identifier___InteractorInputProtocol {
    var presenter: ___VARIABLE_productName:identifier___InteractorOutputProtocol? { get set }
    
}

protocol ___VARIABLE_productName:identifier___InteractorOutputProtocol: class {
    
    
}
