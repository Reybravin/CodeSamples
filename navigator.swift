//Navigator protocol

protocol Navigator {
   associatedtype Destination
   func navigate(to destination: Destination)
}

class LoginNavigator: Navigator {

   private weak var navigationController: UINavigationController?
   private let viewControllerFactory: LoginViewControllerFactory
   
   init(navigationController: UINavigationController, viewControllerFactory: LoginViewControllerFactory) {
      self.navigationController = navigationController
      self.viewControllerFactory = viewControllerFactory
   }
   
   func navigate(to destination: Destination) {
      let viewController = makeViewController(for: destination)
      navigationController?.pushViewController(viewController, animated: true)
   }
   
   private func makeViewController(for destination : Destination) -> UIViewController {
      switch destination {
      case .loginCompleted(let user):
         return viewControllerFactory.makeWelcomeViewController(forUser: user)
         //return WelcomeViewController(user: user)
      case .forgotPassword:
         return viewControllerFactory.makePasswordResetViewController()
         //return PasswordResteViewController()
      case .signup:
         viewControllerFactory.makeSignUpViewController()
         //return SignUpViewController()
      }
      return UIViewController()
   }
   
   enum Destination {
      case loginCompleted(user: User)
      case forgotPassword
      case signup
   }
   
}
