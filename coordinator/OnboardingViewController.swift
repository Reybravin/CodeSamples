//

protocol OnboardingViewControllerDelegate: AnyObject {
   func onboardingViewControllerNextButtonTapped(
      _ viewController: OnboardingViewController
   )
}

class OnboardingViewController: UIViewController {
   weak var delegate: OnboardingViewControllerDelegate?
   
   private func handleNextButtonTap() {
      delegate?.onboardingViewControllerNextButtonTapped(self)
   }
}
