## Default Login Module

**LoginProtocols**

```swift
import Foundation

// MARK: Login Protocols
protocol LoginViewProtocol: class {
    
    var presenter: LoginPresenterProtocol! { get set }
        
    func showIndicator()
    func hideIndicator()
    
    func showErrorMessage(error: String)

}

protocol LoginPresenterProtocol: class {
    var view: LoginViewProtocol? { get set }
    
    func viewDidLoad()
        
    func login(email: String, password: String)
    
    func forgetPassword()
            
}

protocol LoginRouterProtocol {
    func navigateToHome()
    func navigateToForgetPassword()
}

protocol LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol? { get set }
    
    func login(email: String, password: String)
}

protocol LoginInteractorOutputProtocol: class {
    
    func requestFailed(loginResponse: LoginModel)
    func requestFailed(error: String)
    
}
```

**LoginModel**
```swift
import Foundation

// MARK: Login Model -
struct LoginModel: Codable {
    
}

```

**LoginViewController**
```swift
import UIKit

class LoginViewController: UIViewController {

    var presenter: LoginPresenterProtocol!
            
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
	override func viewDidLoad() {
        super.viewDidLoad()

        // If you want the presenter to do something after the loading of the view, Call the following method
        // presenter.viewDidLoad()
    }

    @IBAction func loginPressed(_ sender: Any) {
        presenter.login(email: email.text ?? "", password: password.text ?? "")
    }
    
    @IBAction func forgetPasswordPressed(_ sender: Any) {
        presenter.forgetPassword()
    }
    
}

```

**LoginPresenter**
```swift
// MARK: Login Presenter -
class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {    
    
    weak var view: LoginViewProtocol?
    private let interactor: LoginInteractorInputProtocol
    private let router: LoginRouterProtocol
    
    private var loginResponse: LoginModel?
    
    init(view: LoginViewProtocol, interactor: LoginInteractorInputProtocol, router: LoginRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        // If you want to do something if the viewDidLoad, Call this method in the ViewController
    }
            
    func login(email: String, password: String) {
        view?.showIndicator()
        interactor.login(email: email, password: password)
    }
    
    func forgetPassword() {
        router.navigateToForgetPassword()
    }
    
    func requestSuccess(loginResponse: LoginModel) {
        view?.hideIndicator()
        self.loginResponse = loginResponse
        
        // Login Request Success
        
        // Check if the email and password are true
        if loginResponse.response == true {
                        
            // login success

            // Save Session

            // Navigate To Home
            router.navigateToHome()

        } else {
            // false email or password
            view?.showErrorMessage(error: loginResponse.error)
        }
    }

}

```

**LoginInteractor**
```swift
import Foundation

// MARK: Login Interactor -
class LoginInteractor: LoginInteractorInputProtocol {
    
    weak var presenter: LoginInteractorOutputProtocol?

    func login(email: String, password: String){
        // Perform Network Request for example 
        NetworkClient.performRequest(LoginModel.self, router: Router.login(email: email, password: password), success: { [weak self] (loginResponse) in
            // request success
            self?.presenter?.requestSuccess(loginResponse: loginResponse)
            
        }) { [weak self] (error) in
            // request Request Failed
            self?.presenter?.requestFailed(error: "Something went wrong")
        }
    }
}
```

**LoginViewController+Delegates**
```swift
import UIKit

extension LoginViewController: LoginViewProtocol {
    
    func showErrorMessage(error: String) {
        showErrorNotification(message: error)
    }
    
    func showIndicator() {
        showSpinner()
    }
    
    func hideIndicator() {
        hideSpinner()
    }

}
```

**LoginRouter**
```swift
import UIKit

// MARK: Login Router -
class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        guard let view = MainRouter.instantiate(.Login, .Login) as? LoginViewController else { return nil }

        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }

    func navigateToHome() {
        let homeViewController = HomeRouter.createModule()
        viewController?.navigationController.pushViewController(homeViewController, animated: false)
    }
        
    func navigateToForgetPassword() {
        let forgetPasswordViewContoller = ForgetPasswordRouter.createModule()!
        viewController?.navigationController.pushViewController(forgetPasswordViewContoller, animated: false)
    }

}

```

**LoginViewController.xib**
```swift
    // Here you design your layout
```

