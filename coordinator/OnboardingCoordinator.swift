//

class OnboardingCoordinator: OnboardingViewControllerDelegate {
   weak var delegate: OnboardingCoordinatorDelegate?
   
   private let navigationController: UINavigationController
   private var nextPageIndex = 0
   
   // MARK: - Initializer
   
   init(navigationController: UINavigationController) {
      self.navigationController = navigationController
   }
   
   // MARK: - API
   
   func activate() {
      goToNextPageOrFinish()
   }
   
   // MARK: - OnboardingViewControllerDelegate
   
   func onboardingViewControllerNextButtonTapped(
      _ viewController: OnboardingViewController) {
      goToNextPageOrFinish()
   }
   
   // MARK: - Private
   
   private func goToNextPageOrFinish() {
      // We use an enum to store all content for a given onboarding page
      guard let page = OnboardingPage(rawValue: nextPageIndex) else {
         delegate?.onboardingCoordinatorDidFinish(self)
         return
      }
      
      let nextVC = OnboardingViewController(page: page)
      nextVC.delegate = self
      navigationController.pushViewController(nextVC, animated: true)
      
      nextPageIndex += 1
   }
}
