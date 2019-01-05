//

class LoginViewController: UIViewController {
   
   private let navigator: LoginNavigator
   
   init(navigator: LoginNavigator) {
      self.navigator = navigator
      super.init(nibName: nil, bundle: nil)
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   private func handleLoginButtonTap(){
      performLogin { [weak self] result in
         switch result {
         case .success(let user):
            self?.navigator.navigate(to: .loginCompleted(user: user))
         case .failure(let error):
            self?.show(error)
         }
      }
   }
   
   private func show(_ error: LoadingError){}
   
   //typealias Handler = (Result<Data, LoadingError>) -> Void
   typealias Handler = (Result<User, LoadingError>) -> Void
   
   private func performLogin(completion: @escaping Handler) {}
   
   private func handleForgotPasswordButtonTap() {
      navigator.navigate(to: .forgotPassword)
   }
   
   private func handleSignUpButtonTap() {
      navigator.navigate(to: .signup)
   }
   
}


class SignUpViewController : UIViewController {}
class PasswordResteViewController: UIViewController {}
class WelcomeViewController : UIViewController {
   
   var user : User
   
   init(user: User) {
      self.user = user
      super.init(nibName: nil, bundle: nil) //
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
